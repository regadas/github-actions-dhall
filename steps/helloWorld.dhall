let Step = ../schemas/Step.dhall

let helloWorld
    : Text → Text → Step.Type
    =   λ(name : Text)
      → λ(who-to-greet : Text)
      → Step::{
        , id = Some "hello"
        , name = name
        , run = None Text
        , uses = Some "actions/hello-world-javascript-action@v1"
        , with = Some (toMap { who-to-greet = who-to-greet })
        }

in  helloWorld
