let request:
  (
    ~port: int=?,
    string,
    string,
    ('a, Pbrt.Encoder.t) => unit,
    Pbrt.Decoder.t => 'b,
    'a
  ) =>
  Lwt.t('b);