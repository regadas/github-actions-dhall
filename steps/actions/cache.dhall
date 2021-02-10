let Step = ../../schemas/Step.dhall

let Text/concatMapSep =
      https://prelude.dhall-lang.org/v17.1.0/Text/concatMapSep.dhall sha256:c272aca80a607bc5963d1fcb38819e7e0d3e72ac4d02b1183b1afb6a91340840

in  λ(args : { path : Text, key : Text, hashFiles : List Text }) →
      let keyPrefix = "\${{ runner.os }}-${args.key}-"

      let quote = λ(x : Text) → "'${x}'"

      let hashFilesArg = Text/concatMapSep ", " Text quote args.hashFiles

      in  Step::{
          , name = Some "${args.path} cache"
          , uses = Some "actions/cache@v2"
          , `with` = Some
              ( toMap
                  { path = args.path
                  , key = "${keyPrefix}\${{ hashFiles(${hashFilesArg}) }}"
                  , restore-keys =
                      ''
                      ${keyPrefix}
                      ''
                  }
              )
          }
