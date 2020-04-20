let GithubActions =
      ../package.dhall sha256:59cf2ecc4b4248f82d66878dbc6afe1b01191f5a4d09f4ba7a3b994368a2552c

let helloWorld = GithubActions.steps.helloWorld "Hello world" "Mona the Octocat"

let echo =
      GithubActions.steps.echo
        "Echo the greeting's time"
        "'The time was \${{ steps.hello.outputs.time }}.'"

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
