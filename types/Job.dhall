let Defaults = ./Defaults.dhall

let Env = ./Env.dhall

let RunsOn = ./RunsOn.dhall

let Step = ./Step.dhall

in  { name : Text
    , needs : Optional (List Text)
    , runs-on : RunsOn
    , outputs : Optional (List { mapKey : Text, mapValue : Text })
    , env : Optional Env
    , defaults : Optional Defaults
    , steps : List Step
    , timeout-minutes : Optional Natural
    }
