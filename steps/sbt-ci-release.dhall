let Step = ../schemas/Step.dhall

in    λ(args : { ref : Text, pgpPassphrase: Text, pgpSecret: Text, sonatypePassword: Text, sonatypeUsername: Text })
    → Step::{
      , id = None Text
      , name = Some "Publish ${args.ref}"
      , uses = None Text
      , run = Some "sbt ci-release"
      , env = Some
          ( toMap
              { PGP_PASSPHRASE = args.pgpPassphrase
              , PGP_SECRET = args.pgpSecret
              , SONATYPE_PASSWORD = args.sonatypePassword
              , SONATYPE_USERNAME = args.sonatypeUsername
              }
          )
      }
