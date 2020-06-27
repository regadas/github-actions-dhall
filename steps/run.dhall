let Step = ../schemas/Step.dhall

in  λ(args : { run : Text }) →
      Step::{
      , id = None Text
      , name = None Text
      , run = Some args.run
      , uses = None Text
      }
