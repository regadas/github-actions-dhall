let Push = ../types/events/Push.dhall

let PullRequest = ../types/events/PullRequest.dhall

let Delete = ../types/events/Delete.dhall

let Schedule = ../types/events/Schedule.dhall

let WorkflowDispatch = ../types/events/WorkflowDispatch.dhall

let WorkflowRun = ../types/events/WorkflowRun.dhall

let Release = ../types/events/Release.dhall

in  { push = None Push
    , pull_request = None PullRequest
    , delete = None Delete
    , schedule = None (List Schedule)
    , workflow_dispatch = None WorkflowDispatch
    , workflow_run = None WorkflowRun
    , release = None Release
    }
