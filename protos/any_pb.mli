(** any.proto Binary Encoding *)


(** {2 Protobuf Encoding} *)

val encode_any : Any_types.any -> Pbrt.Encoder.t -> unit
(** [encode_any v encoder] encodes [v] with the given [encoder] *)


(** {2 Protobuf Decoding} *)

val decode_any : Pbrt.Decoder.t -> Any_types.any
(** [decode_any decoder] decodes a [any] value from [decoder] *)
