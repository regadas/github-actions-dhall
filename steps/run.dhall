let Step = ../schemas/Step.dhall

in    λ(args : { name : Text, run : Text })
    → Step::{
      , id = None Text
      , name = args.name
      , run = Some args.run
      , uses = None Text
      }
