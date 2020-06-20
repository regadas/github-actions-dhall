let Strategy = ../types/Strategy.dhall

let Env = ../types/Env.dhall

in  { env = None Env
    , id = None Text
    , name = None Text
    , shell = None Text
    , run = None Text
    , uses = None Text
    , continue-on-error = None Bool
    , with = None (List { mapKey : Text, mapValue : Text })
    , strategy = None Strategy
    , if = None Text
    , working-directory = None Text
    }
