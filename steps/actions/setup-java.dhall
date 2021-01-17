let Step = ../../schemas/Step.dhall

in  λ(args : { java-version : Text }) →
      Step::{
      , id = None Text
      , name = Some "java ${args.java-version} setup"
      , uses = Some "actions/setup-java@v1.4.3"
      , run = None Text
      , `with` = Some
          ( toMap
              { java-version = args.java-version
              , java-package = "jdk"
              , architecture = "x64"
              }
          )
      }
