let Step = ../../schemas/Step.dhall

in  λ(args : { cache-name : Text }) →
      Step::{
      , id = None Text
      , name = None Text
      , uses = Some "cachix/cachix-action@v6"
      , run = None Text
      , with = Some
          ( toMap
              { name = args.cache-name
              , signingKey = "\${{ secrets.CACHIX_SIGNING_KEY }}"
              }
          )
      }
