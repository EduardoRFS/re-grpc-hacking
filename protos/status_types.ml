[@@@ocaml.warning "-27-30-39"]


type status = {
  code : int32;
  message : string;
  details : Any_types.any list;
}

let rec default_status 
  ?code:((code:int32) = 0l)
  ?message:((message:string) = "")
  ?details:((details:Any_types.any list) = [])
  () : status  = {
  code;
  message;
  details;
}
