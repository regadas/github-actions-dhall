{ Job =
    ./defaults/Job.dhall
      sha256:e07fa5d5a564ac6f1fd58e3d753618153b4ef77586f9e13ecbf4a99bfedf3b52
, On =
    ./defaults/On.dhall
      sha256:6ca7c591c8b4d1a0bcf5f73d7cdf763f053f7264a989b52371429bca9ad69be6
, Step =
    ./defaults/Step.dhall
      sha256:d65cc1e58f7721dcc11749bcb51b47ca94c33db04805477a48819a259ca68dfb
, Service =
    ./defaults/Service.dhall
      sha256:df4da0625e279bfe7965136bc8f19c469205929070ffcfc23155c0f667b5bf5d
, Workflow =
    ./defaults/Workflow.dhall
      sha256:17742a8d63e8835f60d7cee0aefab0067cc1c8b50d021a149ce7294840e19f80
, Push =
    ./defaults/events/Push.dhall
      sha256:67d0026a55bf46570c9286d32ffbe8bd48a9ea28984087a1cf4ef4479b4e6d6e
, PullRequest =
    ./defaults/events/PullRequest.dhall
      sha256:97f08f870cf65c0366288de0302c5149d1d16ae0e524bad4f3c617aa8bc8cfba
, Delete =
    ./defaults/events/Delete.dhall
      sha256:9bb9dcb5bf6f795291686f59383bcd01c8e79b87fc3fb63351d46dea100ac51b
, Schedule =
    ./defaults/events/Schedule.dhall
      sha256:9bb9dcb5bf6f795291686f59383bcd01c8e79b87fc3fb63351d46dea100ac51b
, Input =
    ./defaults/Input.dhall
      sha256:047d951f9f951543458f7dd6ceffb5d53585fe2d59ff2a1616e8f4e130615f1a
, WorkflowDispatch =
    ./defaults/events/WorkflowDispatch.dhall
      sha256:2133dc321eb5b06cd0c9ffb6cd412fa1dfd7e20c4341fecbff2b17ce29119958
, Release =
    ./defaults/events/Release.dhall
      sha256:08967ae33ec89511f588be7a92274edf9c752801f38ba9c7122f8e684cfcea18
, actions/HaskellSetup =
    ./defaults/actions/HaskellSetup.dhall
      sha256:e0762bf1442388cce1187fbac3e606685337f45b0e69251cfa33e513dc03c709
}
