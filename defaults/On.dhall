let Push = ../types/events/Push.dhall

let PullRequest = ../types/events/PullRequest.dhall

let PullRequestReview = ../types/events/PullRequestReview.dhall

let Delete = ../types/events/Delete.dhall

let Schedule = ../types/events/Schedule.dhall

let RepositoryDispatch = ../types/events/RepositoryDispatch.dhall

let WorkflowDispatch = ../types/events/WorkflowDispatch.dhall

let WorkflowRun = ../types/events/WorkflowRun.dhall

let Release = ../types/events/Release.dhall

let MergeGroup = ../types/events/MergeGroup.dhall

in  { push = None Push
    , pull_request = None PullRequest
    , pull_request_review = None PullRequestReview
    , delete = None Delete
    , schedule = None (List Schedule)
    , repository_dispatch = None RepositoryDispatch
    , workflow_dispatch = None WorkflowDispatch
    , workflow_run = None WorkflowRun
    , release = None Release
    , merge_group = None MergeGroup
    }
