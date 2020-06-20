let Push = ../types/events/Push.dhall

let PullRequest = ../types/events/PullRequest.dhall

let Delete = ../types/events/Delete.dhall

in  { push = None Push, pull_request = None PullRequest, delete = None Delete }
