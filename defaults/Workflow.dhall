let Env = ../types/Env.dhall

let Defaults = ../types/Defaults.dhall

let Concurrency = ../types/Concurrency.dhall

let Permission = ../types/Permission.dhall

let PermissionAccess = ../types/PermissionAccess.dhall

in  { env = None Env
    , defaults = None Defaults
    , concurrency = None Concurrency
    , permissions =
        None (List { mapKey : Permission, mapValue : PermissionAccess })
    }
