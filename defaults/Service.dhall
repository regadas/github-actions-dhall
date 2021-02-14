let Credentials = ../types/Credentials.dhall

let Env = ../types/Env.dhall

in  { credentials = None Credentials
    , env = None Env
    , ports = None (List Text)
    , volumes = None (List Text)
    , options = None Text
    }
