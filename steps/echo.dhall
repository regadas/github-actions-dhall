let Step = ../schemas/Step.dhall

in    λ(name : Text)
    → λ(what : Text)
    → Step::{
      , id = Some "echo"
      , name = name
      , run = Some "echo ${what}"
      , uses = None Text
      }
