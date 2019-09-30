(** code.proto Binary Encoding *)


(** {2 Protobuf Encoding} *)

val encode_code : Code_types.code -> Pbrt.Encoder.t -> unit
(** [encode_code v encoder] encodes [v] with the given [encoder] *)


(** {2 Protobuf Decoding} *)

val decode_code : Pbrt.Decoder.t -> Code_types.code
(** [decode_code decoder] decodes a [code] value from [decoder] *)
