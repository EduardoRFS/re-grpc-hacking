open Base;
open H2;
open Lwt.Infix;

module Client = H2_lwt_unix.Client;

let create_socket = (host, port) => {
  // TODO: close socket
  let%bind address = Utils.find_address(host, port);
  let socket = Lwt_unix.socket(Unix.PF_INET, Unix.SOCK_STREAM, 0);
  let%map _ = Lwt_unix.connect(socket, address);

  socket;
};
// TODO: default error_handler
let error_handler = Console.log;

// TODO: allow overwrite
let create_headers = host =>
  Headers.of_list([
    (":authority", host),
    ("te", "trailers"),
    // TODO: timeout
    // ("grpc-timeout", ""),
    ("content-type", "application/grpc+proto"),
    ("grpc-encoding", "identity"),
    ("grpc-accept-encoding", "identity"),
    // TODO: user-agent
    ("user-agent", "grpc-ocaml/0.0.0"),
  ]);

type t = {
  host: string,
  scheme: string,
  connection: Client.t,
};
let create = (~scheme="http", ~port=50051, host) => {
  let%bind socket = create_socket(host, port);
  let%map connection = Client.create_connection(~error_handler, socket);
  {host, scheme, connection};
};
let h2_request = (client, path, data) => {
  let (response_received, notify_response_received) = Lwt.wait();

  let response_handler = (_, response_body) => {
    let _ =
      Utils.body_to_string(response_body)
      >|= Lwt.wakeup_later(notify_response_received);
    ();
  };

  let headers = create_headers(client.host);

  let request = Request.create(`POST, ~scheme="https", path, ~headers);
  let request_body =
    Client.request(
      client.connection,
      request,
      ~error_handler,
      ~response_handler,
    );

  Body.write_string(request_body, data);
  Body.close_writer(request_body);
  response_received;
};

let request =
    (
      type req,
      type res,
      path,
      (
        module Request: Types.Message with type t = req,
        module Response: Types.Message with type t = res,
      ),
      client,
      request,
    ) =>
  request
  |> Utils.encode(Request.to_proto)
  >>= h2_request(client, path)
  >>= Utils.decode(Response.from_proto);