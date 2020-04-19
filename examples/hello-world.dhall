let Workflow = ../schemas/Workflow.dhall

let Job = ../schemas/Job.dhall

let RunsOn = ../types/RunsOn.dhall

let On = ../types/On.dhall

let helloWorld = ../steps/helloWorld.dhall "Hello world" "Mona the Octocat"

let echo =
      ../steps/echo.dhall
        "Echo the greeting's time"
        "echo 'The time was \${{ steps.hello.outputs.time }}.'"

in  Workflow::{
    , name = "Greeting"
    , on = On.l [ < pull_request | push >.push ]
    , jobs = toMap
        { build = Job::{
          , name = "Greeting"
          , runs-on = RunsOn.ubuntu-latest
          , steps = [ helloWorld, echo ]
          }
        }
    }
