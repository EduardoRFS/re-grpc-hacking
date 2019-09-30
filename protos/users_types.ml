[@@@ocaml.warning "-27-30-39"]


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

let rec default_create_user_request 
  ?first_name:((first_name:string) = "")
  ?last_name:((last_name:string) = "")
  ?date_of_birth:((date_of_birth:int64) = 0L)
  () : create_user_request  = {
  first_name;
  last_name;
  date_of_birth;
}

let rec default_user 
  ?id:((id:string) = "")
  ?first_name:((first_name:string) = "")
  ?last_name:((last_name:string) = "")
  ?date_of_birth:((date_of_birth:int64) = 0L)
  () : user  = {
  id;
  first_name;
  last_name;
  date_of_birth;
}

let rec default_create_user_response 
  ?status:((status:Status_types.status option) = None)
  ?user:((user:user option) = None)
  () : create_user_response  = {
  status;
  user;
}

let rec default_read_user_options 
  ?cache_age:((cache_age:int32) = 0l)
  () : read_user_options  = {
  cache_age;
}

let rec default_read_user_request 
  ?options:((options:read_user_options option) = None)
  ?id:((id:string) = "")
  () : read_user_request  = {
  options;
  id;
}

let rec default_read_user_response 
  ?status:((status:Status_types.status option) = None)
  ?user:((user:user option) = None)
  () : read_user_response  = {
  status;
  user;
}

let rec default_list_users_options 
  ?cache_age:((cache_age:int32) = 0l)
  () : list_users_options  = {
  cache_age;
}

let rec default_list_users_request 
  ?options:((options:list_users_options option) = None)
  ?id:((id:string list) = [])
  () : list_users_request  = {
  options;
  id;
}

let rec default_list_users_response 
  ?status:((status:Status_types.status option) = None)
  ?users:((users:user list) = [])
  () : list_users_response  = {
  status;
  users;
}
