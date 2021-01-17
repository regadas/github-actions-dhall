let Step = ../../schemas/Step.dhall

let Text/concatMapSep =
      https://prelude.dhall-lang.org/v17.1.0/Text/concatMapSep.dhall sha256:c272aca80a607bc5963d1fcb38819e7e0d3e72ac4d02b1183b1afb6a91340840

in  λ(args : { path : Text, key : Text, hashFiles : List Text }) →
      let hashFilesArg =
            Text/concatMapSep "," Text (λ(x : Text) → "'${x}'") args.hashFiles

      in  Step::{
          , id = None Text
          , name = Some "${args.path} cache"
          , uses = Some "actions/cache@v2.1.3"
          , run = None Text
          , `with` = Some
              ( toMap
                  { path = args.path
                  , key =
                      "\${{ runner.os }}-${args.key}-\${{ hashFiles('${hashFilesArg}') }}"
                  , restore-keys = args.key
                  }
              )
          }
