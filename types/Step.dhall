let Defaults = ./Defaults.dhall

let Env = ./Env.dhall

let RunsOn = ./RunsOn.dhall

let Strategy = ./Strategy.dhall

in  { id : Optional Text
    , name : Optional Text
    , env : Optional Env
    , run : Optional Text
    , uses : Optional Text
    , shell : Optional Text
    , `with` : Optional (List { mapKey : Text, mapValue : Text })
    , continue-on-error : Optional Bool
    , strategy : Optional Strategy
    , `if` : Optional Text
    , working-directory : Optional Text
    }
