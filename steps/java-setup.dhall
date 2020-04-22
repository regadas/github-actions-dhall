let Step = ../schemas/Step.dhall

in    λ(args : { name : Text, java-version : Text })
    → Step::{
      , id = None Text
      , name = args.name
      , uses = Some "actions/setup-java@v1"
      , run = None Text
      , with = Some
          ( toMap
              { java-version = args.java-version
              , java-package = "jdk"
              , architecture = "x64"
              }
          )
      }
