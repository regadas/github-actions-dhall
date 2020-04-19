let Workflow = ../schemas/Workflow.dhall

let Job = ../schemas/Job.dhall

let RunsOn = ../types/RunsOn.dhall

let On = ../schemas/On.dhall

let Push = ../schemas/events/Push.dhall

let helloWorld = ../steps/helloWorld.dhall "Hello world" "Mona the Octocat"

let echo =
      ../steps/echo.dhall
        "Echo the greeting's time"
        "'The time was \${{ steps.hello.outputs.time }}.'"

in  Workflow::{
    , name = "Greeting"
    , on = On::{ push = Some Push::{=} }
    , jobs = toMap
        { build = Job::{
          , name = "Greeting"
          , runs-on = RunsOn.ubuntu-latest
          , steps = [ helloWorld, echo ]
          }
        }
    }
