let Push = ../types/events/Push.dhall

let PullRequest = ../types/events/PullRequest.dhall

let Delete = ../types/events/Delete.dhall

let Schedule = ../types/events/Schedule.dhall

let WorkflowDispatch = ../types/events/WorkflowDispatch.dhall

in  { push = None Push
    , pull_request = None PullRequest
    , delete = None Delete
    , schedule = None (List Schedule)
    , workflow_dispatch = None WorkflowDispatch
    }
