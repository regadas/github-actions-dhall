let On = ./On.dhall

let Env = ./Env.dhall

let Concurrency = ./Concurrency.dhall

let Defaults = ./Defaults.dhall

let Job = ./Job.dhall

let Permission = ./Permission.dhall

let PermissionAccess = ./PermissionAccess.dhall

in  { name : Text
    , on : On
    , env : Optional Env
    , concurrency : Optional Concurrency
    , defaults : Optional Defaults
    , permissions :
        Optional (List { mapKey : Permission, mapValue : PermissionAccess })
    , jobs : List { mapKey : Text, mapValue : Job }
    }
