let Step = ../schemas/Step.dhall

in  Step::{
    , id = None Text
    , name = None Text
    , uses = Some "actions/checkout@v2.1.0"
    , run = None Text
    , with = None (List { mapKey : Text, mapValue : Text })
    }
