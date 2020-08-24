let Step = ../../schemas/Step.dhall

in  λ(args : { java-version : Text }) →
      Step::{
      , id = None Text
      , name = Some "java ${args.java-version} setup"
      , uses = Some "olafurpg/setup-java@v6"
      , run = None Text
      , `with` = Some (toMap { java-version = args.java-version })
      }
