(** any.proto Types *)



(** {2 Types} *)

type any = {
  type_url : string;
  value : bytes;
}


(** {2 Default values} *)

val default_any : 
  ?type_url:string ->
  ?value:bytes ->
  unit ->
  any
(** [default_any ()] is the default value for type [any] *)
