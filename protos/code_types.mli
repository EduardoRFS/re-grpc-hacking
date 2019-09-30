(** code.proto Types *)



(** {2 Types} *)

type code =
  | Ok 
  | Cancelled 
  | Unknown 
  | Invalid_argument 
  | Deadline_exceeded 
  | Not_found 
  | Already_exists 
  | Permission_denied 
  | Unauthenticated 
  | Resource_exhausted 
  | Failed_precondition 
  | Aborted 
  | Out_of_range 
  | Unimplemented 
  | Internal 
  | Unavailable 
  | Data_loss 


(** {2 Default values} *)

val default_code : unit -> code
(** [default_code ()] is the default value for type [code] *)
