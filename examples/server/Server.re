open Lwt.Infix;
open Protos.Users;
open Protos.UsersService.Server;

let server = () => {
  open GRPC.Server;
  let read_user =
    readUser(request => {
      open Protos.ReadUserResponse;
      open Protos.User;

      let id = request.id;
      let user = {id, first_name: "", last_name: "", date_of_birth: 0};
      Lwt.return({user: Some(user)});
    });
  listen(~port=50051, [read_user]);
};
Lwt.async(() => server());
{
  let (forever, _) = Lwt.wait();
  Lwt_main.run(forever);
};