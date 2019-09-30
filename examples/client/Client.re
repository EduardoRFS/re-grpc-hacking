open Lwt.Infix;

open Protos.Users_pb;
open Protos.Users_types;

let client = () => {
  open GRPC.Client;
  let read_user =
    request(
      "localhost",
      "/protos.UsersService/ReadUser",
      encode_read_user_request,
      decode_read_user_response,
    );

  let find_user = id => {
    let%map response = read_user({options: None, id});
    Console.log(response);
  };

  find_user("b9ca41e9-9ce9-4852-8b11-c6386cfb0e25");
};

client() |> Lwt_main.run;