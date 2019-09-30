type route;
let route:
  (
    string,
    Pbrt.Decoder.t => 'a,
    ('b, Pbrt.Encoder.t) => unit,
    'a => Lwt.t('b)
  ) =>
  route;
let listen: (~host: string=?, ~port: int=?, list(route)) => Lwt.t(unit);