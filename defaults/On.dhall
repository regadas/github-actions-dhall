let Push = ../types/events/Push.dhall

let PullRequest = ../types/events/PullRequest.dhall

in  { push = None Push, pull_request = None PullRequest }
