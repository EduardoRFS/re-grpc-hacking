(** status.proto Types *)



(** {2 Types} *)

type status = {
  code : int32;
  message : string;
  details : Any_types.any list;
}


(** {2 Default values} *)

val default_status : 
  ?code:int32 ->
  ?message:string ->
  ?details:Any_types.any list ->
  unit ->
  status
(** [default_status ()] is the default value for type [status] *)
