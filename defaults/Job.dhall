let Defaults = ../types/Defaults.dhall

let Env = ../types/Env.dhall

in  { needs = None (List Text)
    , outputs = None (List { mapKey : Text, mapValue : Text })
    , env = None Env
    , defaults = None Defaults
    , timeout-minutes = None Natural
    }
