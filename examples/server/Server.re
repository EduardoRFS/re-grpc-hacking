open Lwt.Infix;

open Protos.Users_pb;
open Protos.Users_types;

let server = () => {
  open GRPC.Server;

  let read_user =
    route(
      "ReadUser",
      decode_read_user_request,
      encode_read_user_response,
      request => {
        let id = request.id;
        let user = default_user(~id, ());
        Lwt.return({status: None, user: Some(user)});
      },
    );

  listen(~port=50051, [read_user]);
};

Lwt.async(() => server());
{
  let (forever, _) = Lwt.wait();
  Lwt_main.run(forever);
};