let Step = ../schemas/Step.dhall

in    λ(args : { name : Text })
    → Step::{
      , id = Some "checkout"
      , name = args.name
      , uses = Some "actions/checkout@v2.1.0"
      , run = None Text
      , with = None (List { mapKey : Text, mapValue : Text })
      }
