let Defaults = ../types/Defaults.dhall

let Env = ../types/Env.dhall

let Strategy = ../types/Strategy.dhall

in  { name = None Text
    , needs = None (List Text)
    , strategy = None Strategy
    , outputs = None (List { mapKey : Text, mapValue : Text })
    , env = None Env
    , defaults = None Defaults
    , timeout-minutes = None Natural
    , if = None Text
    }
