let find_address: (string, int) => Lwt.t(Lwt_unix.sockaddr);
let body_to_string: H2.Body.t([ | `read]) => Lwt.t(string);

let encode: ('a => Protobuf.Writer.t, 'a) => Lwt.t(string);
let decode:
  (Protobuf.Reader.t => result('a, Protobuf.Deserialize.error), string) =>
  Lwt.t('a);