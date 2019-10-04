type t;

let create: (~scheme: string=?, ~port: int=?, string) => Lwt.t(t);
let request: (string, Types.endpoint('req, 'res), t, 'req) => Lwt.t('res);