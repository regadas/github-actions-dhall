let Step = ../../schemas/Step.dhall

let Text/concatMapSep =
      https://prelude.dhall-lang.org/v17.1.0/Text/concatMapSep.dhall sha256:c272aca80a607bc5963d1fcb38819e7e0d3e72ac4d02b1183b1afb6a91340840

let List/null =
      https://prelude.dhall-lang.org/v17.1.0/List/null.dhall sha256:2338e39637e9a50d66ae1482c0ed559bbcc11e9442bfca8f8c176bbcd9c4fc80

in  λ(args : { path : Text, key : Text, hashFiles : List Text }) →
      let keyComponent = "\${{ runner.os }}-${args.key}-"

      let quote = λ(x : Text) → "'${x}'"

      let hashFilesArg = Text/concatMapSep ", " Text quote args.hashFiles

      let hashFilesComponent =
            if    List/null Text args.hashFiles
            then  ""
            else  "\${{ hashFiles(${hashFilesArg}) }}"

      in  Step::{
          , name = Some "${args.path} cache"
          , uses = Some "actions/cache@v2"
          , `with` = Some
              ( toMap
                  { path = args.path
                  , key = "${keyComponent}${hashFilesComponent}"
                  , restore-keys =
                      ''
                      ${keyComponent}
                      ''
                  }
              )
          }
