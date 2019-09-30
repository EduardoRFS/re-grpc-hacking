let find_address: (string, int) => Lwt.t(Lwt_unix.sockaddr);
let body_to_bytes: H2.Body.t([ | `read]) => Lwt.t(Base.bytes);
let encode: (('a, Pbrt.Encoder.t) => unit, 'a) => bytes;
let decode: (Pbrt.Decoder.t => 'a, bytes) => 'a;