let Step = ../schemas/Step.dhall

in Step::{
    , id = None Text
    , name = None Text
    , uses = Some "olafurpg/setup-scala@v2"
    , run = None Text
    , with = None (List { mapKey : Text, mapValue : Text })
    }
