let Step = ../schemas/Step.dhall

in    λ(args : { path : Text, key : Text, hashFile : Text })
    → Step::{
      , id = None Text
      , name = Some "${args.path} cache"
      , uses = Some "actions/cache@v1"
      , run = None Text
      , `with` = Some
          ( toMap
              { path = args.path
              , key =
                  "\${{ runner.os }}-${args.key}-\${{ hashFiles('${args.hashFile}') }}"
              , restore-keys = args.key
              }
          )
      }
