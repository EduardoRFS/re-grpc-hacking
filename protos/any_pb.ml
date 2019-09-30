[@@@ocaml.warning "-27-30-39"]

type any_mutable = {
  mutable type_url : string;
  mutable value : bytes;
}

let default_any_mutable () : any_mutable = {
  type_url = "";
  value = Bytes.create 0;
}


let rec decode_any d =
  let v = default_any_mutable () in
  let continue__= ref true in
  while !continue__ do
    match Pbrt.Decoder.key d with
    | None -> (
    ); continue__ := false
    | Some (1, Pbrt.Bytes) -> begin
      v.type_url <- Pbrt.Decoder.string d;
    end
    | Some (1, pk) -> 
      Pbrt.Decoder.unexpected_payload "Message(any), field(1)" pk
    | Some (2, Pbrt.Bytes) -> begin
      v.value <- Pbrt.Decoder.bytes d;
    end
    | Some (2, pk) -> 
      Pbrt.Decoder.unexpected_payload "Message(any), field(2)" pk
    | Some (_, payload_kind) -> Pbrt.Decoder.skip d payload_kind
  done;
  ({
    Any_types.type_url = v.type_url;
    Any_types.value = v.value;
  } : Any_types.any)

let rec encode_any (v:Any_types.any) encoder = 
  Pbrt.Encoder.key (1, Pbrt.Bytes) encoder; 
  Pbrt.Encoder.string v.Any_types.type_url encoder;
  Pbrt.Encoder.key (2, Pbrt.Bytes) encoder; 
  Pbrt.Encoder.bytes v.Any_types.value encoder;
  ()
