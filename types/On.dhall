let Push = ./events/Push.dhall

let PullRequest = ./events/PullRequest.dhall

let PullRequestReview = ./events/PullRequestReview.dhall

let Delete = ./events/Delete.dhall

let Schedule = ./events/Schedule.dhall

let RepositoryDispatch = ./events/RepositoryDispatch.dhall

let WorkflowDispatch = ./events/WorkflowDispatch.dhall

let WorkflowRun = ./events/WorkflowRun.dhall

let Release = ./events/Release.dhall

in  { push : Optional Push
    , pull_request : Optional PullRequest
    , pull_request_review : Optional PullRequestReview
    , delete : Optional Delete
    , schedule : Optional (List Schedule)
    , repository_dispatch : Optional RepositoryDispatch
    , workflow_dispatch : Optional WorkflowDispatch
    , workflow_run : Optional WorkflowRun
    , release : Optional Release
    }
