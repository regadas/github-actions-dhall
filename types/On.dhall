let Push = ./events/Push.dhall

let PullRequest = ./events/PullRequest.dhall

let Delete = ./events/Delete.dhall

let Schedule = ./events/Schedule.dhall

let WorkflowDispatch = ./events/WorkflowDispatch.dhall

in  { push : Optional Push
    , pull_request : Optional PullRequest
    , delete : Optional Delete
    , schedule : Optional (List Schedule)
    , workflow_dispatch : Optional WorkflowDispatch
    }
