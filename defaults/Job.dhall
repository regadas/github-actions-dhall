let Concurrency = ../types/Concurrency.dhall

let Container = ../types/Container.dhall

let Defaults = ../types/Defaults.dhall

let Env = ../types/Env.dhall

let Service = ../types/Service.dhall

let Strategy = ../types/Strategy.dhall

in  { name = None Text
    , needs = None (List Text)
    , strategy = None Strategy
    , outputs = None (List { mapKey : Text, mapValue : Text })
    , env = None Env
    , defaults = None Defaults
    , timeout-minutes = None Natural
    , `if` = None Text
    , services = None (List { mapKey : Text, mapValue : Service })
    , container = None Container
    , concurrency = None Concurrency
    }
