[@@@ocaml.warning "-27-30-39"]


type any = {
  type_url : string;
  value : bytes;
}

let rec default_any 
  ?type_url:((type_url:string) = "")
  ?value:((value:bytes) = Bytes.create 0)
  () : any  = {
  type_url;
  value;
}
