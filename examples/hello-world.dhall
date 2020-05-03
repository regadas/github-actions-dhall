let GithubActions = ../package.dhall

let helloWorld =
      GithubActions.steps.helloWorld
        { name = "Hello World", who-to-greet = "Mona the Octocat" }

let echo =
      GithubActions.steps.echo
        { name = "Echo the greeting's time"
        , what = "'The time was \${{ steps.hello.outputs.time }}.'"
        }

in  GithubActions.Workflow::{
    , name = "Greeting"
    , on = GithubActions.On::{ push = Some GithubActions.Push::{=} }
    , jobs = toMap
        { build = GithubActions.Job::{
          , name = "Greeting"
          , runs-on = GithubActions.RunsOn.Type.ubuntu-latest
          , steps = [ helloWorld, echo ]
          }
        }
    }
