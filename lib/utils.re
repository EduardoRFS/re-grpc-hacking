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
let body_to_string = body => {
  let (data_received, notify_data_received) = Lwt.wait();
  let rec read_response = string =>
    H2.Body.schedule_read(
      body,
      ~on_eof=() => Lwt.wakeup_later(notify_data_received, string),
      ~on_read=
        (bigstring, ~off, ~len) => {
          string ++ Bigstringaf.to_string(bigstring) |> read_response
        },
    );
  read_response("");
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
  "\x00" ++ (body |> String.length |> int_to_bytes |> Bytes.to_string);
};

let encode = (encode_fn, message) => {
  let writer = encode_fn(message);

  let body = Protobuf.Writer.contents(writer);
  let header = create_header(body);

  header ++ body |> Lwt.return;
};
let decode = (decode_fn, bytes) => {
  // header size
  let offset = 5;
  let length = String.length(bytes) - offset;
  let reader = Protobuf.Reader.create(~offset, ~length, bytes);
  switch (reader |> decode_fn) {
  | Ok(message) => Lwt.return(message)
  | Error(_) => Lwt.fail_with("An error happened at decode")
  };
};