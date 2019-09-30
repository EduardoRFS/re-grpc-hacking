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

// TODO: allow overwrite
let headers =
  Headers.add_list(
    Headers.empty,
    [
      ("te", "trailers"),
      ("content-type", "application/grpc"),
      (
        "user-agent",
        "grpc-node/1.23.3 grpc-c/7.0.0 (linux; chttp2; gangnam)",
      ),
      ("grpc-accept-encoding", "identity,deflate,gzip"),
      ("accept-encoding", "identity,gzip"),
      (":authority", "localhost"),
    ],
  );

let h2_request = (~port=443, host, path, data) => {
  let error_handler = a => Console.log(a);
  let response_handler = (notify_response_received, _, response_body) => {
    let _ =
      Utils.body_to_bytes(response_body)
      >|= Lwt.wakeup_later(notify_response_received);
    ();
  };

  let (response_received, notify_response_received) = Lwt.wait();
  let response_handler = response_handler(notify_response_received);

  let%bind socket = create_socket(host, port);
  let%bind connection = Client.create_connection(~error_handler, socket);

  let request = Request.create(`POST, ~scheme="https", path, ~headers);
  let request_body =
    Client.request(connection, request, ~error_handler, ~response_handler);

  Body.write_string(request_body, Bytes.to_string(data));
  Body.close_writer(request_body);
  response_received;
};

let request = (~port=50051, host, path, encode_fn, decode_fn, request) =>
  Utils.encode(encode_fn, request)
  |> h2_request(~port, host, path)
  >|= Utils.decode(decode_fn);