open Base;

let find_address = (host, port) => {
  open Lwt.Infix;
  let%bind addresses =
    Lwt_unix.getaddrinfo(
      host,
      Int.to_string(port),
      [Unix.AI_FAMILY(PF_INET)],
    );
  switch (List.hd(addresses)) {
  | Some(address) => Lwt.return(address.ai_addr)
  | None => Lwt.fail_with("Address not found")
  };
};
let body_to_bytes = body => {
  let (data_received, notify_data_received) = Lwt.wait();
  let rec read_response = bytes =>
    H2.Body.schedule_read(
      body,
      ~on_eof=() => Lwt.wakeup_later(notify_data_received, bytes),
      ~on_read=
        (bigstring, ~off, ~len) => {
          let fragment = Bytes.create(len);
          Bigstringaf.blit_to_bytes(
            bigstring,
            ~src_off=off,
            fragment,
            ~dst_off=0,
            ~len,
          );
          // TODO: shouldn't use this
          Caml.BytesLabels.cat(bytes, fragment) |> read_response;
        },
    );
  read_response(Bytes.create(0));
  data_received;
};
let create_header = body => {
  let int_to_bytes = t =>
    Int.(
      {
        let get = n => (t land (2 ** n - 1)) lsr (n - 8);
        [get(32), get(24), get(16), get(8)]
        |> List.map(~f=Char.of_int_exn)
        |> Bytes.of_char_list;
      }
    );
  // TODO: shouldn't use this
  Caml.Bytes.cat(
    Bytes.of_string("\x00"),
    body |> Bytes.length |> int_to_bytes,
  );
};
let remove_header = bytes =>
  Bytes.sub(~pos=5, ~len=Bytes.length(bytes) - 5, bytes);
let encode = (encode_fn, message) => {
  let encoder = Pbrt.Encoder.create();
  encode_fn(message, encoder);

  let body = Pbrt.Encoder.to_bytes(encoder);
  let header = create_header(body);

  Caml.Bytes.cat(header, body);
};
let decode = (decode_fn, bytes) =>
  remove_header(bytes) |> Pbrt.Decoder.of_bytes |> decode_fn;