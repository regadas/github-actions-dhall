let Step = ../../schemas/Step.dhall

in  Step::{
    , id = None Text
    , name = None Text
    , uses = Some "actions/checkout@v2.3.4"
    , run = None Text
    , `with` = None (List { mapKey : Text, mapValue : Text })
    }
