open H2;
open Base;
open Lwt.Infix;

type route_fn = bytes => Lwt.t(bytes);
type route = (string, route_fn);

let route = (name, decode_fn, encode_fn, middleware) => {
  let fn = bytes =>
    Utils.decode(decode_fn, bytes) |> middleware >|= Utils.encode(encode_fn);

  (name, fn);
};

// TODO: allow overwrite
let headers =
  Headers.add_list(
    Headers.empty,
    [
      ("content-type", "application/grpc"),
      ("grpc-accept-encoding", "identity,deflate,gzip"),
      ("accept-encoding", "identity,gzip"),
      ("grpc-status", "0"),
      ("grpc-message", "OK"),
    ],
  );
let create_connection_handler = routes => {
  let error_handler =
      (_client_address, ~request as _=?, error, _start_response) =>
    switch (error) {
    | `Bad_request => Console.log("Bad Request")
    | `Internal_server_error => Console.log("Internal_server_error")
    | `Exn(exn) => Console.log(exn)
    };

  let request_handler = (_client_address, request_descriptor) => {
    let request = Reqd.request(request_descriptor);
    let grpc_method =
      List.nth_exn(String.split_on_chars(~on=['/'], request.target), 2);

    // TODO: verify method
    switch (Map.find(routes, grpc_method)) {
    | Some(route) =>
      let _ = {
        let%map data =
          Reqd.request_body(request_descriptor)
          |> Utils.body_to_bytes
          >>= route;

        let response = Response.create(~headers, `OK);
        let response_body =
          Reqd.respond_with_streaming(request_descriptor, response);
        Body.write_string(response_body, Bytes.to_string(data));
        Reqd.send_trailer_headers(request_descriptor, headers);
        Body.close_writer(response_body);
      };
      ();
    | None => Console.log("Sorry bro, I don't know what you're trying to do")
    };
  };
  H2_lwt_unix.Server.create_connection_handler(
    ~config=H2.Config.default,
    ~request_handler,
    ~error_handler,
  );
};
let socket_listen = (host, port, connection_handler) => {
  let%bind address = Utils.find_address(host, port);
  let%map _servefr =
    Lwt_io.establish_server_with_client_socket(address, connection_handler);
  Console.log("it should be running");
  // Printf.printf "Listening on port %i and echoing POST requests.\n" !port;
  // print_string "To send a POST request, try\n\n";
  // print_string "  curl https://localhost:8080 -k -X POST -d foo\n\n";
  // flush stdout;
  // Lwt.return_unit);
};

let listen = (~host="localhost", ~port=50051, routes: list(route)) => {
  switch (routes |> Map.of_alist((module Base.String))) {
  | `Ok(routes) =>
    let connection_handler = create_connection_handler(routes);
    socket_listen(host, port, connection_handler);
  | `Duplicate_key(key) => Lwt.fail_with(key)
  };
};