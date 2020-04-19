let Push = ./events/Push.dhall

let PullRequest = ./events/PullRequest.dhall

in  < l : List < push | pull_request >
    | events : { push : Push, pull_request : PullRequest }
    >
