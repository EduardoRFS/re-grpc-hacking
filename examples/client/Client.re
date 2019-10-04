open Lwt.Infix;
open Protos.Users;
open Protos.UsersService.Client;

let client = () => {
  open GRPC.Client;
  let%bind connection = create("localhost");

  let find_user = id => {
    let%map response = readUser(connection, {id: id});
    Console.log(response.user);
  };

  find_user("b9ca41e9-9ce9-4852-8b11-c6386cfb0e25");
};

client() |> Lwt_main.run;