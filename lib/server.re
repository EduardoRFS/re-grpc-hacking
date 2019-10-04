open H2;
open Base;
open Lwt.Infix;

type route_fn = string => Lwt.t(string);
type route = (string, route_fn);

let route =
    (
      type req,
      type res,
      name,
      (
        module Request: Types.Message with type t = req,
        module Response: Types.Message with type t = res,
      ),
      middleware,
    ) => {
  let fn = bytes =>
    bytes
    |> Utils.decode(Request.from_proto)
    >>= middleware
    >>= Utils.encode(Response.to_proto);
  (name, fn);
};

// TODO: allow overwrite
let headers =
  Headers.of_list([
    ("grpc-encoding", "identity"),
    ("grpc-accept-encoding", "identity"),
    ("content-type", "application/grpc+proto"),
  ]);
let trailer_headers =
  Headers.of_list([("grpc-status", "0"), ("grpc-message", "OK")]);

// TODO: default error handler
let error_handler = (_client_address, ~request as _=?, error, _start_response) =>
  switch (error) {
  | `Bad_request => Console.log("Bad Request")
  | `Internal_server_error => Console.log("Internal_server_error")
  | `Exn(exn) => Console.log(exn)
  };

let create_connection_handler = routes => {
  let request_handler = (_client_address, request_descriptor) => {
    let request = Reqd.request(request_descriptor);

    // TODO: verify method
    switch (Map.find(routes, request.target)) {
    | Some(route) =>
      let _ = {
        let%map data =
          Reqd.request_body(request_descriptor)
          |> Utils.body_to_string
          >>= route;

        let response = Response.create(~headers, `OK);
        let response_body =
          Reqd.respond_with_streaming(request_descriptor, response);
        Body.write_string(response_body, data);
        Reqd.send_trailer_headers(request_descriptor, trailer_headers);
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