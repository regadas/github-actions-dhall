let GithubActions =
      https://raw.githubusercontent.com/regadas/github-actions-dhall/master/package.dhall sha256:06e487b9ad805b241c3f01a09a3fddb4db1eb2b51f95cda2c99f63ad56dd607e

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
          , name = Some "Greeting"
          , runs-on = GithubActions.RunsOn.Type.ubuntu-latest
          , steps = [ helloWorld, echo ]
          }
        }
    }
