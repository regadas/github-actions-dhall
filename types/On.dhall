let Push = ./events/Push.dhall

let PullRequest = ./events/PullRequest.dhall

let Delete = ./events/Delete.dhall

in  { push : Optional Push
    , pull_request : Optional PullRequest
    , delete : Optional Delete
    }
