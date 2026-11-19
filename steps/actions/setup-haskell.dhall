let List/concatMap =
      https://raw.githubusercontent.com/dhall-lang/dhall-lang/v23.1.0/Prelude/List/concatMap.dhall
        sha256:3b2167061d11fda1e4f6de0522cbe83e0d5ac4ef5ddf6bb0b2064470c5d3fb64

let Map =
      https://raw.githubusercontent.com/dhall-lang/dhall-lang/v23.1.0/Prelude/Map/package.dhall
        sha256:c5e79a9de642644a09b96a2ec3147c5d8662b7926f09610e751c0c0f6ed0b30a

let Optional/map =
      https://raw.githubusercontent.com/dhall-lang/dhall-lang/v23.1.0/Prelude/Optional/map.dhall
        sha256:501534192d988218d43261c299cc1d1e0b13d25df388937add784778ab0054fa

let Step = ../../schemas/Step.dhall

let HaskellSetup = ../../schemas/actions/HaskellSetup.dhall

let stringBool =
      Optional/map Bool Text (λ(b : Bool) → if b then "true" else "false")

let haskell-setup
    : HaskellSetup.Type → Step.Type
    = λ(args : HaskellSetup.Type) →
        Step::{
        , uses = Some "haskell/actions/setup@v1"
        , `with` = Some
            ( List/concatMap
                (Map.Entry Text (Optional Text))
                (Map.Entry Text Text)
                ( λ(e : Map.Entry Text (Optional Text)) →
                    merge
                      { None = [] : Map.Type Text Text
                      , Some = λ(v : Text) → [ Map.keyText e.mapKey v ]
                      }
                      e.mapValue
                )
                ( toMap
                    { ghc-version = args.ghc-version
                    , cabal-version = args.cabal-version
                    , stack-version = args.stack-version
                    , enable-stack = stringBool args.enable-stack
                    , stack-no-global = stringBool args.stack-no-global
                    , stack-setup-ghc = stringBool args.stack-setup-ghc
                    , disable-matcher = stringBool args.disable-matcher
                    }
                )
            )
        }

in  haskell-setup
