module Protos = struct
  module rec CreateUserRequest : sig
    val name: unit -> string
    type t = {
      first_name: string;
      last_name: string;
      date_of_birth: int;
    } [@@deriving show { with_path = false }, eq]
    val to_proto: t -> Protobuf.Writer.t
    val from_proto: Protobuf.Reader.t -> (t, Protobuf.Deserialize.error) result
  end = struct 
    let name () = "Users.protos.CreateUserRequest"
    type t = {
      first_name: string;
      last_name: string;
      date_of_birth: int;
    } [@@deriving show { with_path = false }, eq]
    let rec to_proto { first_name; last_name; date_of_birth } = 
      let open Protobuf.Serialize in
      serialize ((1, Basic (String)) ^:: (2, Basic (String)) ^:: (3, Basic (Int64)) ^::  Nil) first_name last_name date_of_birth 
    [@@warning "-39"]
    let rec from_proto data =
      let open Base.Result.Monad_infix in
      let (sentinal_1, deser_1) = Protobuf.Deserialize.sentinal (Basic (String)) in
      let (sentinal_2, deser_2) = Protobuf.Deserialize.sentinal (Basic (String)) in
      let (sentinal_3, deser_3) = Protobuf.Deserialize.sentinal (Basic (Int64)) in
      let spec = [] @ [ (1, deser_1); (2, deser_2); (3, deser_3) ] in
      Protobuf.Deserialize.deserialize spec data >>= fun () -> 
      Base.Result.return { first_name = sentinal_1 (); last_name = sentinal_2 (); date_of_birth = sentinal_3 () }
    [@@warning "-39"]
  end
  and CreateUserResponse : sig
    val name: unit -> string
    type t = {
      user: User.t option;
    } [@@deriving show { with_path = false }, eq]
    val to_proto: t -> Protobuf.Writer.t
    val from_proto: Protobuf.Reader.t -> (t, Protobuf.Deserialize.error) result
  end = struct 
    let name () = "Users.protos.CreateUserResponse"
    type t = {
      user: User.t option;
    } [@@deriving show { with_path = false }, eq]
    let rec to_proto { user } = 
      let open Protobuf.Serialize in
      serialize ((1, Message User.to_proto) ^::  Nil) user 
    [@@warning "-39"]
    let rec from_proto data =
      let open Base.Result.Monad_infix in
      let (sentinal_1, deser_1) = Protobuf.Deserialize.sentinal (Message User.from_proto) in
      let spec = [] @ [ (1, deser_1) ] in
      Protobuf.Deserialize.deserialize spec data >>= fun () -> 
      Base.Result.return { user = sentinal_1 () }
    [@@warning "-39"]
  end
  and ReadUserRequest : sig
    val name: unit -> string
    type t = {
      id: string;
    } [@@deriving show { with_path = false }, eq]
    val to_proto: t -> Protobuf.Writer.t
    val from_proto: Protobuf.Reader.t -> (t, Protobuf.Deserialize.error) result
  end = struct 
    let name () = "Users.protos.ReadUserRequest"
    type t = {
      id: string;
    } [@@deriving show { with_path = false }, eq]
    let rec to_proto { id } = 
      let open Protobuf.Serialize in
      serialize ((1, Basic (String)) ^::  Nil) id 
    [@@warning "-39"]
    let rec from_proto data =
      let open Base.Result.Monad_infix in
      let (sentinal_1, deser_1) = Protobuf.Deserialize.sentinal (Basic (String)) in
      let spec = [] @ [ (1, deser_1) ] in
      Protobuf.Deserialize.deserialize spec data >>= fun () -> 
      Base.Result.return { id = sentinal_1 () }
    [@@warning "-39"]
  end
  and ReadUserResponse : sig
    val name: unit -> string
    type t = {
      user: User.t option;
    } [@@deriving show { with_path = false }, eq]
    val to_proto: t -> Protobuf.Writer.t
    val from_proto: Protobuf.Reader.t -> (t, Protobuf.Deserialize.error) result
  end = struct 
    let name () = "Users.protos.ReadUserResponse"
    type t = {
      user: User.t option;
    } [@@deriving show { with_path = false }, eq]
    let rec to_proto { user } = 
      let open Protobuf.Serialize in
      serialize ((1, Message User.to_proto) ^::  Nil) user 
    [@@warning "-39"]
    let rec from_proto data =
      let open Base.Result.Monad_infix in
      let (sentinal_1, deser_1) = Protobuf.Deserialize.sentinal (Message User.from_proto) in
      let spec = [] @ [ (1, deser_1) ] in
      Protobuf.Deserialize.deserialize spec data >>= fun () -> 
      Base.Result.return { user = sentinal_1 () }
    [@@warning "-39"]
  end
  and User : sig
    val name: unit -> string
    type t = {
      id: string;
      first_name: string;
      last_name: string;
      date_of_birth: int;
    } [@@deriving show { with_path = false }, eq]
    val to_proto: t -> Protobuf.Writer.t
    val from_proto: Protobuf.Reader.t -> (t, Protobuf.Deserialize.error) result
  end = struct 
    let name () = "Users.protos.User"
    type t = {
      id: string;
      first_name: string;
      last_name: string;
      date_of_birth: int;
    } [@@deriving show { with_path = false }, eq]
    let rec to_proto { id; first_name; last_name; date_of_birth } = 
      let open Protobuf.Serialize in
      serialize ((1, Basic (String)) ^:: (2, Basic (String)) ^:: (3, Basic (String)) ^:: (4, Basic (Int64)) ^::  Nil) id first_name last_name date_of_birth 
    [@@warning "-39"]
    let rec from_proto data =
      let open Base.Result.Monad_infix in
      let (sentinal_1, deser_1) = Protobuf.Deserialize.sentinal (Basic (String)) in
      let (sentinal_2, deser_2) = Protobuf.Deserialize.sentinal (Basic (String)) in
      let (sentinal_3, deser_3) = Protobuf.Deserialize.sentinal (Basic (String)) in
      let (sentinal_4, deser_4) = Protobuf.Deserialize.sentinal (Basic (Int64)) in
      let spec = [] @ [ (1, deser_1); (2, deser_2); (3, deser_3); (4, deser_4) ] in
      Protobuf.Deserialize.deserialize spec data >>= fun () -> 
      Base.Result.return { id = sentinal_1 (); first_name = sentinal_2 (); last_name = sentinal_3 (); date_of_birth = sentinal_4 () }
    [@@warning "-39"]
  end
  module UsersService = struct
    let createUser = 
    ( (module CreateUserRequest : Protobuf.Service.Message with type t = CreateUserRequest.t ), 
      (module CreateUserResponse : Protobuf.Service.Message with type t = CreateUserResponse.t ) )
    let readUser = 
    ( (module ReadUserRequest : Protobuf.Service.Message with type t = ReadUserRequest.t ), 
      (module ReadUserResponse : Protobuf.Service.Message with type t = ReadUserResponse.t ) )
    module Client = struct
      let createUser = GRPC.Client.request "/protos.UsersService/CreateUser" createUser
      let readUser = GRPC.Client.request "/protos.UsersService/ReadUser" readUser
    end
    module Server = struct
      let createUser = GRPC.Server.route "/protos.UsersService/CreateUser" createUser
      let readUser = GRPC.Server.route "/protos.UsersService/ReadUser" readUser
    end
  end
end