let Strategy = ../types/Strategy.dhall

let Env = ../types/Env.dhall

in  { env = None Env
    , shell = None Text
    , continue-on-error = None Bool
    , with = None (List { mapKey : Text, mapValue : Text })
    , strategy = None Strategy
    , if = None Text
    , working-directory = None Text
    , id = None Text
    , uses = None Text
    , run = None Text
    }
