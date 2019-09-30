[@@@ocaml.warning "-27-30-39"]

type create_user_request_mutable = {
  mutable first_name : string;
  mutable last_name : string;
  mutable date_of_birth : int64;
}

let default_create_user_request_mutable () : create_user_request_mutable = {
  first_name = "";
  last_name = "";
  date_of_birth = 0L;
}

type user_mutable = {
  mutable id : string;
  mutable first_name : string;
  mutable last_name : string;
  mutable date_of_birth : int64;
}

let default_user_mutable () : user_mutable = {
  id = "";
  first_name = "";
  last_name = "";
  date_of_birth = 0L;
}

type create_user_response_mutable = {
  mutable status : Status_types.status option;
  mutable user : Users_types.user option;
}

let default_create_user_response_mutable () : create_user_response_mutable = {
  status = None;
  user = None;
}

type read_user_options_mutable = {
  mutable cache_age : int32;
}

let default_read_user_options_mutable () : read_user_options_mutable = {
  cache_age = 0l;
}

type read_user_request_mutable = {
  mutable options : Users_types.read_user_options option;
  mutable id : string;
}

let default_read_user_request_mutable () : read_user_request_mutable = {
  options = None;
  id = "";
}

type read_user_response_mutable = {
  mutable status : Status_types.status option;
  mutable user : Users_types.user option;
}

let default_read_user_response_mutable () : read_user_response_mutable = {
  status = None;
  user = None;
}

type list_users_options_mutable = {
  mutable cache_age : int32;
}

let default_list_users_options_mutable () : list_users_options_mutable = {
  cache_age = 0l;
}

type list_users_request_mutable = {
  mutable options : Users_types.list_users_options option;
  mutable id : string list;
}

let default_list_users_request_mutable () : list_users_request_mutable = {
  options = None;
  id = [];
}

type list_users_response_mutable = {
  mutable status : Status_types.status option;
  mutable users : Users_types.user list;
}

let default_list_users_response_mutable () : list_users_response_mutable = {
  status = None;
  users = [];
}


let rec decode_create_user_request d =
  let v = default_create_user_request_mutable () in
  let continue__= ref true in
  while !continue__ do
    match Pbrt.Decoder.key d with
    | None -> (
    ); continue__ := false
    | Some (1, Pbrt.Bytes) -> begin
      v.first_name <- Pbrt.Decoder.string d;
    end
    | Some (1, pk) -> 
      Pbrt.Decoder.unexpected_payload "Message(create_user_request), field(1)" pk
    | Some (2, Pbrt.Bytes) -> begin
      v.last_name <- Pbrt.Decoder.string d;
    end
    | Some (2, pk) -> 
      Pbrt.Decoder.unexpected_payload "Message(create_user_request), field(2)" pk
    | Some (3, Pbrt.Varint) -> begin
      v.date_of_birth <- Pbrt.Decoder.int64_as_varint d;
    end
    | Some (3, pk) -> 
      Pbrt.Decoder.unexpected_payload "Message(create_user_request), field(3)" pk
    | Some (_, payload_kind) -> Pbrt.Decoder.skip d payload_kind
  done;
  ({
    Users_types.first_name = v.first_name;
    Users_types.last_name = v.last_name;
    Users_types.date_of_birth = v.date_of_birth;
  } : Users_types.create_user_request)

let rec decode_user d =
  let v = default_user_mutable () in
  let continue__= ref true in
  while !continue__ do
    match Pbrt.Decoder.key d with
    | None -> (
    ); continue__ := false
    | Some (1, Pbrt.Bytes) -> begin
      v.id <- Pbrt.Decoder.string d;
    end
    | Some (1, pk) -> 
      Pbrt.Decoder.unexpected_payload "Message(user), field(1)" pk
    | Some (2, Pbrt.Bytes) -> begin
      v.first_name <- Pbrt.Decoder.string d;
    end
    | Some (2, pk) -> 
      Pbrt.Decoder.unexpected_payload "Message(user), field(2)" pk
    | Some (3, Pbrt.Bytes) -> begin
      v.last_name <- Pbrt.Decoder.string d;
    end
    | Some (3, pk) -> 
      Pbrt.Decoder.unexpected_payload "Message(user), field(3)" pk
    | Some (4, Pbrt.Varint) -> begin
      v.date_of_birth <- Pbrt.Decoder.int64_as_varint d;
    end
    | Some (4, pk) -> 
      Pbrt.Decoder.unexpected_payload "Message(user), field(4)" pk
    | Some (_, payload_kind) -> Pbrt.Decoder.skip d payload_kind
  done;
  ({
    Users_types.id = v.id;
    Users_types.first_name = v.first_name;
    Users_types.last_name = v.last_name;
    Users_types.date_of_birth = v.date_of_birth;
  } : Users_types.user)

let rec decode_create_user_response d =
  let v = default_create_user_response_mutable () in
  let continue__= ref true in
  while !continue__ do
    match Pbrt.Decoder.key d with
    | None -> (
    ); continue__ := false
    | Some (1, Pbrt.Bytes) -> begin
      v.status <- Some (Status_pb.decode_status (Pbrt.Decoder.nested d));
    end
    | Some (1, pk) -> 
      Pbrt.Decoder.unexpected_payload "Message(create_user_response), field(1)" pk
    | Some (2, Pbrt.Bytes) -> begin
      v.user <- Some (decode_user (Pbrt.Decoder.nested d));
    end
    | Some (2, pk) -> 
      Pbrt.Decoder.unexpected_payload "Message(create_user_response), field(2)" pk
    | Some (_, payload_kind) -> Pbrt.Decoder.skip d payload_kind
  done;
  ({
    Users_types.status = v.status;
    Users_types.user = v.user;
  } : Users_types.create_user_response)

let rec decode_read_user_options d =
  let v = default_read_user_options_mutable () in
  let continue__= ref true in
  while !continue__ do
    match Pbrt.Decoder.key d with
    | None -> (
    ); continue__ := false
    | Some (1, Pbrt.Varint) -> begin
      v.cache_age <- Pbrt.Decoder.int32_as_varint d;
    end
    | Some (1, pk) -> 
      Pbrt.Decoder.unexpected_payload "Message(read_user_options), field(1)" pk
    | Some (_, payload_kind) -> Pbrt.Decoder.skip d payload_kind
  done;
  ({
    Users_types.cache_age = v.cache_age;
  } : Users_types.read_user_options)

let rec decode_read_user_request d =
  let v = default_read_user_request_mutable () in
  let continue__= ref true in
  while !continue__ do
    match Pbrt.Decoder.key d with
    | None -> (
    ); continue__ := false
    | Some (1, Pbrt.Bytes) -> begin
      v.options <- Some (decode_read_user_options (Pbrt.Decoder.nested d));
    end
    | Some (1, pk) -> 
      Pbrt.Decoder.unexpected_payload "Message(read_user_request), field(1)" pk
    | Some (2, Pbrt.Bytes) -> begin
      v.id <- Pbrt.Decoder.string d;
    end
    | Some (2, pk) -> 
      Pbrt.Decoder.unexpected_payload "Message(read_user_request), field(2)" pk
    | Some (_, payload_kind) -> Pbrt.Decoder.skip d payload_kind
  done;
  ({
    Users_types.options = v.options;
    Users_types.id = v.id;
  } : Users_types.read_user_request)

let rec decode_read_user_response d =
  let v = default_read_user_response_mutable () in
  let continue__= ref true in
  while !continue__ do
    match Pbrt.Decoder.key d with
    | None -> (
    ); continue__ := false
    | Some (1, Pbrt.Bytes) -> begin
      v.status <- Some (Status_pb.decode_status (Pbrt.Decoder.nested d));
    end
    | Some (1, pk) -> 
      Pbrt.Decoder.unexpected_payload "Message(read_user_response), field(1)" pk
    | Some (2, Pbrt.Bytes) -> begin
      v.user <- Some (decode_user (Pbrt.Decoder.nested d));
    end
    | Some (2, pk) -> 
      Pbrt.Decoder.unexpected_payload "Message(read_user_response), field(2)" pk
    | Some (_, payload_kind) -> Pbrt.Decoder.skip d payload_kind
  done;
  ({
    Users_types.status = v.status;
    Users_types.user = v.user;
  } : Users_types.read_user_response)

let rec decode_list_users_options d =
  let v = default_list_users_options_mutable () in
  let continue__= ref true in
  while !continue__ do
    match Pbrt.Decoder.key d with
    | None -> (
    ); continue__ := false
    | Some (1, Pbrt.Varint) -> begin
      v.cache_age <- Pbrt.Decoder.int32_as_varint d;
    end
    | Some (1, pk) -> 
      Pbrt.Decoder.unexpected_payload "Message(list_users_options), field(1)" pk
    | Some (_, payload_kind) -> Pbrt.Decoder.skip d payload_kind
  done;
  ({
    Users_types.cache_age = v.cache_age;
  } : Users_types.list_users_options)

let rec decode_list_users_request d =
  let v = default_list_users_request_mutable () in
  let continue__= ref true in
  while !continue__ do
    match Pbrt.Decoder.key d with
    | None -> (
      v.id <- List.rev v.id;
    ); continue__ := false
    | Some (1, Pbrt.Bytes) -> begin
      v.options <- Some (decode_list_users_options (Pbrt.Decoder.nested d));
    end
    | Some (1, pk) -> 
      Pbrt.Decoder.unexpected_payload "Message(list_users_request), field(1)" pk
    | Some (2, Pbrt.Bytes) -> begin
      v.id <- (Pbrt.Decoder.string d) :: v.id;
    end
    | Some (2, pk) -> 
      Pbrt.Decoder.unexpected_payload "Message(list_users_request), field(2)" pk
    | Some (_, payload_kind) -> Pbrt.Decoder.skip d payload_kind
  done;
  ({
    Users_types.options = v.options;
    Users_types.id = v.id;
  } : Users_types.list_users_request)

let rec decode_list_users_response d =
  let v = default_list_users_response_mutable () in
  let continue__= ref true in
  while !continue__ do
    match Pbrt.Decoder.key d with
    | None -> (
      v.users <- List.rev v.users;
    ); continue__ := false
    | Some (1, Pbrt.Bytes) -> begin
      v.status <- Some (Status_pb.decode_status (Pbrt.Decoder.nested d));
    end
    | Some (1, pk) -> 
      Pbrt.Decoder.unexpected_payload "Message(list_users_response), field(1)" pk
    | Some (2, Pbrt.Bytes) -> begin
      v.users <- (decode_user (Pbrt.Decoder.nested d)) :: v.users;
    end
    | Some (2, pk) -> 
      Pbrt.Decoder.unexpected_payload "Message(list_users_response), field(2)" pk
    | Some (_, payload_kind) -> Pbrt.Decoder.skip d payload_kind
  done;
  ({
    Users_types.status = v.status;
    Users_types.users = v.users;
  } : Users_types.list_users_response)

let rec encode_create_user_request (v:Users_types.create_user_request) encoder = 
  Pbrt.Encoder.key (1, Pbrt.Bytes) encoder; 
  Pbrt.Encoder.string v.Users_types.first_name encoder;
  Pbrt.Encoder.key (2, Pbrt.Bytes) encoder; 
  Pbrt.Encoder.string v.Users_types.last_name encoder;
  Pbrt.Encoder.key (3, Pbrt.Varint) encoder; 
  Pbrt.Encoder.int64_as_varint v.Users_types.date_of_birth encoder;
  ()

let rec encode_user (v:Users_types.user) encoder = 
  Pbrt.Encoder.key (1, Pbrt.Bytes) encoder; 
  Pbrt.Encoder.string v.Users_types.id encoder;
  Pbrt.Encoder.key (2, Pbrt.Bytes) encoder; 
  Pbrt.Encoder.string v.Users_types.first_name encoder;
  Pbrt.Encoder.key (3, Pbrt.Bytes) encoder; 
  Pbrt.Encoder.string v.Users_types.last_name encoder;
  Pbrt.Encoder.key (4, Pbrt.Varint) encoder; 
  Pbrt.Encoder.int64_as_varint v.Users_types.date_of_birth encoder;
  ()

let rec encode_create_user_response (v:Users_types.create_user_response) encoder = 
  begin match v.Users_types.status with
  | Some x -> 
    Pbrt.Encoder.key (1, Pbrt.Bytes) encoder; 
    Pbrt.Encoder.nested (Status_pb.encode_status x) encoder;
  | None -> ();
  end;
  begin match v.Users_types.user with
  | Some x -> 
    Pbrt.Encoder.key (2, Pbrt.Bytes) encoder; 
    Pbrt.Encoder.nested (encode_user x) encoder;
  | None -> ();
  end;
  ()

let rec encode_read_user_options (v:Users_types.read_user_options) encoder = 
  Pbrt.Encoder.key (1, Pbrt.Varint) encoder; 
  Pbrt.Encoder.int32_as_varint v.Users_types.cache_age encoder;
  ()

let rec encode_read_user_request (v:Users_types.read_user_request) encoder = 
  begin match v.Users_types.options with
  | Some x -> 
    Pbrt.Encoder.key (1, Pbrt.Bytes) encoder; 
    Pbrt.Encoder.nested (encode_read_user_options x) encoder;
  | None -> ();
  end;
  Pbrt.Encoder.key (2, Pbrt.Bytes) encoder; 
  Pbrt.Encoder.string v.Users_types.id encoder;
  ()

let rec encode_read_user_response (v:Users_types.read_user_response) encoder = 
  begin match v.Users_types.status with
  | Some x -> 
    Pbrt.Encoder.key (1, Pbrt.Bytes) encoder; 
    Pbrt.Encoder.nested (Status_pb.encode_status x) encoder;
  | None -> ();
  end;
  begin match v.Users_types.user with
  | Some x -> 
    Pbrt.Encoder.key (2, Pbrt.Bytes) encoder; 
    Pbrt.Encoder.nested (encode_user x) encoder;
  | None -> ();
  end;
  ()

let rec encode_list_users_options (v:Users_types.list_users_options) encoder = 
  Pbrt.Encoder.key (1, Pbrt.Varint) encoder; 
  Pbrt.Encoder.int32_as_varint v.Users_types.cache_age encoder;
  ()

let rec encode_list_users_request (v:Users_types.list_users_request) encoder = 
  begin match v.Users_types.options with
  | Some x -> 
    Pbrt.Encoder.key (1, Pbrt.Bytes) encoder; 
    Pbrt.Encoder.nested (encode_list_users_options x) encoder;
  | None -> ();
  end;
  List.iter (fun x -> 
    Pbrt.Encoder.key (2, Pbrt.Bytes) encoder; 
    Pbrt.Encoder.string x encoder;
  ) v.Users_types.id;
  ()

let rec encode_list_users_response (v:Users_types.list_users_response) encoder = 
  begin match v.Users_types.status with
  | Some x -> 
    Pbrt.Encoder.key (1, Pbrt.Bytes) encoder; 
    Pbrt.Encoder.nested (Status_pb.encode_status x) encoder;
  | None -> ();
  end;
  List.iter (fun x -> 
    Pbrt.Encoder.key (2, Pbrt.Bytes) encoder; 
    Pbrt.Encoder.nested (encode_user x) encoder;
  ) v.Users_types.users;
  ()
