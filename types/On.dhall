let Push = ./events/Push.dhall

let PullRequest = ./events/PullRequest.dhall

in  { push : Optional Push, pull_request : Optional PullRequest }
