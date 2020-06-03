let On = ./On.dhall

let Push = ./events/Push.dhall

let PullRequest = ./events/PullRequest.dhall

let Env = ./Env.dhall

let Defaults = ./Defaults.dhall

let Job = ./Job.dhall

in  { name : Optional Text
    , on : On
    , env : Optional Env
    , defaults : Optional Defaults
    , jobs : List { mapKey : Text, mapValue : Job }
    }
