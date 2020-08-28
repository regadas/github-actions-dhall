let GithubActions =
      https://raw.githubusercontent.com/regadas/github-actions-dhall/master/package.dhall sha256:cc677589e6d7e13705d106ec6b90cbaa643942b2721ec30af6e256cfcdc925ed

let helloWorld =
      GithubActions.steps.actions/helloWorld
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
