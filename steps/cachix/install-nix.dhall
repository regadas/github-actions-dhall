let Step = ../../schemas/Step.dhall

in  Step::{
    , id = None Text
    , name = None Text
    , uses = Some "cachix/install-nix-action@v9"
    , run = None Text
    , with = None (List { mapKey : Text, mapValue : Text })
    }
