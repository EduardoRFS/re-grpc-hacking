(** users.proto Binary Encoding *)


(** {2 Protobuf Encoding} *)

val encode_create_user_request : Users_types.create_user_request -> Pbrt.Encoder.t -> unit
(** [encode_create_user_request v encoder] encodes [v] with the given [encoder] *)

val encode_user : Users_types.user -> Pbrt.Encoder.t -> unit
(** [encode_user v encoder] encodes [v] with the given [encoder] *)

val encode_create_user_response : Users_types.create_user_response -> Pbrt.Encoder.t -> unit
(** [encode_create_user_response v encoder] encodes [v] with the given [encoder] *)

val encode_read_user_options : Users_types.read_user_options -> Pbrt.Encoder.t -> unit
(** [encode_read_user_options v encoder] encodes [v] with the given [encoder] *)

val encode_read_user_request : Users_types.read_user_request -> Pbrt.Encoder.t -> unit
(** [encode_read_user_request v encoder] encodes [v] with the given [encoder] *)

val encode_read_user_response : Users_types.read_user_response -> Pbrt.Encoder.t -> unit
(** [encode_read_user_response v encoder] encodes [v] with the given [encoder] *)

val encode_list_users_options : Users_types.list_users_options -> Pbrt.Encoder.t -> unit
(** [encode_list_users_options v encoder] encodes [v] with the given [encoder] *)

val encode_list_users_request : Users_types.list_users_request -> Pbrt.Encoder.t -> unit
(** [encode_list_users_request v encoder] encodes [v] with the given [encoder] *)

val encode_list_users_response : Users_types.list_users_response -> Pbrt.Encoder.t -> unit
(** [encode_list_users_response v encoder] encodes [v] with the given [encoder] *)


(** {2 Protobuf Decoding} *)

val decode_create_user_request : Pbrt.Decoder.t -> Users_types.create_user_request
(** [decode_create_user_request decoder] decodes a [create_user_request] value from [decoder] *)

val decode_user : Pbrt.Decoder.t -> Users_types.user
(** [decode_user decoder] decodes a [user] value from [decoder] *)

val decode_create_user_response : Pbrt.Decoder.t -> Users_types.create_user_response
(** [decode_create_user_response decoder] decodes a [create_user_response] value from [decoder] *)

val decode_read_user_options : Pbrt.Decoder.t -> Users_types.read_user_options
(** [decode_read_user_options decoder] decodes a [read_user_options] value from [decoder] *)

val decode_read_user_request : Pbrt.Decoder.t -> Users_types.read_user_request
(** [decode_read_user_request decoder] decodes a [read_user_request] value from [decoder] *)

val decode_read_user_response : Pbrt.Decoder.t -> Users_types.read_user_response
(** [decode_read_user_response decoder] decodes a [read_user_response] value from [decoder] *)

val decode_list_users_options : Pbrt.Decoder.t -> Users_types.list_users_options
(** [decode_list_users_options decoder] decodes a [list_users_options] value from [decoder] *)

val decode_list_users_request : Pbrt.Decoder.t -> Users_types.list_users_request
(** [decode_list_users_request decoder] decodes a [list_users_request] value from [decoder] *)

val decode_list_users_response : Pbrt.Decoder.t -> Users_types.list_users_response
(** [decode_list_users_response decoder] decodes a [list_users_response] value from [decoder] *)
