let Concurrency = ./Concurrency.dhall

let Container = ./Container.dhall

let Defaults = ./Defaults.dhall

let Env = ./Env.dhall

let JobEnv = ./JobEnv.dhall

let RunsOn = ./RunsOn.dhall

let Service = ./Service.dhall

let Step = ./Step.dhall

let Strategy = ./Strategy.dhall

let Permission = ./Permission.dhall

let PermissionAccess = ./PermissionAccess.dhall

in  { name : Optional Text
    , needs : Optional (List Text)
    , runs-on : RunsOn
    , environment : Optional JobEnv
    , strategy : Optional Strategy
    , outputs : Optional (List { mapKey : Text, mapValue : Text })
    , env : Optional Env
    , defaults : Optional Defaults
    , steps : List Step
    , timeout-minutes : Optional Natural
    , `if` : Optional Text
    , services : Optional (List { mapKey : Text, mapValue : Service })
    , container : Optional Container
    , concurrency : Optional Concurrency
    , permissions :
        Optional (List { mapKey : Permission, mapValue : PermissionAccess })
    , secrets : Optional (List { mapKey : Text, mapValue : Text })
    }
