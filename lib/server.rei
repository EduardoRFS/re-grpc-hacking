type route;
let route:
  (
    string,
    (
      module Types.Message with type t = 'req,
      module Types.Message with type t = 'res,
    ),
    'req => Lwt.t('res)
  ) =>
  route;
let listen: (~host: string=?, ~port: int=?, list(route)) => Lwt.t(unit);