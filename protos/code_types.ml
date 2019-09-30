[@@@ocaml.warning "-27-30-39"]


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

let rec default_code () = (Ok:code)
