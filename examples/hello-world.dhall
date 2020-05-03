let GithubActions =
      ../package.dhall sha256:f707e8fea087d72b5a1da4e4564557568b8f80f1c5d68b3e7bbd9c17c22ee38a

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
