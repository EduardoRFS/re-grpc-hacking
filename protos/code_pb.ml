[@@@ocaml.warning "-27-30-39"]


let rec decode_code d = 
  match Pbrt.Decoder.int_as_varint d with
  | 0 -> (Code_types.Ok:Code_types.code)
  | 1 -> (Code_types.Cancelled:Code_types.code)
  | 2 -> (Code_types.Unknown:Code_types.code)
  | 3 -> (Code_types.Invalid_argument:Code_types.code)
  | 4 -> (Code_types.Deadline_exceeded:Code_types.code)
  | 5 -> (Code_types.Not_found:Code_types.code)
  | 6 -> (Code_types.Already_exists:Code_types.code)
  | 7 -> (Code_types.Permission_denied:Code_types.code)
  | 16 -> (Code_types.Unauthenticated:Code_types.code)
  | 8 -> (Code_types.Resource_exhausted:Code_types.code)
  | 9 -> (Code_types.Failed_precondition:Code_types.code)
  | 10 -> (Code_types.Aborted:Code_types.code)
  | 11 -> (Code_types.Out_of_range:Code_types.code)
  | 12 -> (Code_types.Unimplemented:Code_types.code)
  | 13 -> (Code_types.Internal:Code_types.code)
  | 14 -> (Code_types.Unavailable:Code_types.code)
  | 15 -> (Code_types.Data_loss:Code_types.code)
  | _ -> Pbrt.Decoder.malformed_variant "code"

let rec encode_code (v:Code_types.code) encoder =
  match v with
  | Code_types.Ok -> Pbrt.Encoder.int_as_varint (0) encoder
  | Code_types.Cancelled -> Pbrt.Encoder.int_as_varint 1 encoder
  | Code_types.Unknown -> Pbrt.Encoder.int_as_varint 2 encoder
  | Code_types.Invalid_argument -> Pbrt.Encoder.int_as_varint 3 encoder
  | Code_types.Deadline_exceeded -> Pbrt.Encoder.int_as_varint 4 encoder
  | Code_types.Not_found -> Pbrt.Encoder.int_as_varint 5 encoder
  | Code_types.Already_exists -> Pbrt.Encoder.int_as_varint 6 encoder
  | Code_types.Permission_denied -> Pbrt.Encoder.int_as_varint 7 encoder
  | Code_types.Unauthenticated -> Pbrt.Encoder.int_as_varint 16 encoder
  | Code_types.Resource_exhausted -> Pbrt.Encoder.int_as_varint 8 encoder
  | Code_types.Failed_precondition -> Pbrt.Encoder.int_as_varint 9 encoder
  | Code_types.Aborted -> Pbrt.Encoder.int_as_varint 10 encoder
  | Code_types.Out_of_range -> Pbrt.Encoder.int_as_varint 11 encoder
  | Code_types.Unimplemented -> Pbrt.Encoder.int_as_varint 12 encoder
  | Code_types.Internal -> Pbrt.Encoder.int_as_varint 13 encoder
  | Code_types.Unavailable -> Pbrt.Encoder.int_as_varint 14 encoder
  | Code_types.Data_loss -> Pbrt.Encoder.int_as_varint 15 encoder
