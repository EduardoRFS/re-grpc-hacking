(** users.proto Types *)



(** {2 Types} *)

type create_user_request = {
  first_name : string;
  last_name : string;
  date_of_birth : int64;
}

type user = {
  id : string;
  first_name : string;
  last_name : string;
  date_of_birth : int64;
}

type create_user_response = {
  status : Status_types.status option;
  user : user option;
}

type read_user_options = {
  cache_age : int32;
}

type read_user_request = {
  options : read_user_options option;
  id : string;
}

type read_user_response = {
  status : Status_types.status option;
  user : user option;
}

type list_users_options = {
  cache_age : int32;
}

type list_users_request = {
  options : list_users_options option;
  id : string list;
}

type list_users_response = {
  status : Status_types.status option;
  users : user list;
}


(** {2 Default values} *)

val default_create_user_request : 
  ?first_name:string ->
  ?last_name:string ->
  ?date_of_birth:int64 ->
  unit ->
  create_user_request
(** [default_create_user_request ()] is the default value for type [create_user_request] *)

val default_user : 
  ?id:string ->
  ?first_name:string ->
  ?last_name:string ->
  ?date_of_birth:int64 ->
  unit ->
  user
(** [default_user ()] is the default value for type [user] *)

val default_create_user_response : 
  ?status:Status_types.status option ->
  ?user:user option ->
  unit ->
  create_user_response
(** [default_create_user_response ()] is the default value for type [create_user_response] *)

val default_read_user_options : 
  ?cache_age:int32 ->
  unit ->
  read_user_options
(** [default_read_user_options ()] is the default value for type [read_user_options] *)

val default_read_user_request : 
  ?options:read_user_options option ->
  ?id:string ->
  unit ->
  read_user_request
(** [default_read_user_request ()] is the default value for type [read_user_request] *)

val default_read_user_response : 
  ?status:Status_types.status option ->
  ?user:user option ->
  unit ->
  read_user_response
(** [default_read_user_response ()] is the default value for type [read_user_response] *)

val default_list_users_options : 
  ?cache_age:int32 ->
  unit ->
  list_users_options
(** [default_list_users_options ()] is the default value for type [list_users_options] *)

val default_list_users_request : 
  ?options:list_users_options option ->
  ?id:string list ->
  unit ->
  list_users_request
(** [default_list_users_request ()] is the default value for type [list_users_request] *)

val default_list_users_response : 
  ?status:Status_types.status option ->
  ?users:user list ->
  unit ->
  list_users_response
(** [default_list_users_response ()] is the default value for type [list_users_response] *)
