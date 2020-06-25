let Step = ../schemas/Step.dhall

in  λ(args : { name : Text, who-to-greet : Text }) →
      Step::{
      , id = None Text
      , name = Some args.name
      , run = None Text
      , uses = Some "actions/hello-world-javascript-action@v1"
      , `with` = Some (toMap { who-to-greet = args.who-to-greet })
      }
