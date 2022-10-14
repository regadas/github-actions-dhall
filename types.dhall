{ Job =
    ./types/Job.dhall
      sha256:78227a2dde64b328969709adc7016955ba15ab421197c5a044356176ce291276
, JobEnv =
    ./types/JobEnv.dhall
      sha256:521e86d74ae30cec88804eb9fa8014510297c9cf6b4b412d1576df31ed72dc6f
, Defaults =
    ./types/Defaults.dhall
      sha256:a2963761aaa06bae9abd5575667afbba6539d8ce694a4a82900bf4f9df2e7932
, Strategy =
    ./types/Strategy.dhall
      sha256:060bf27380c527f136c2c86ba1cf1f7cab6ad3dd339e655db0873cc8068b7b9d
, On =
    ./types/On.dhall
      sha256:fe10c0076ea72be36c6afff879330f9e9008b97099a02b48865e6bd22d0fd0d0
, Step =
    ./types/Step.dhall
      sha256:c2efe65fd3b819521612000af9ebee52e7a74cce4c37de891dcdc7d6c25169fa
, RunsOn =
    ./types/RunsOn.dhall
      sha256:9efc5b4e1cc4ce2f06aa59c77ae4f9fb47287d79b65c8469dbfa375af9eb21e8
, Env =
    ./types/Env.dhall
      sha256:e73a2ec07449acffe1a4ba9cd261b845a8beb8f81fbc1415575639e99da668e6
, Service =
    ./types/Service.dhall
      sha256:c957b80c6a0d53dce7bf05921c1983797b5d52958ded76244cd94ae80deb94e5
, Workflow =
    ./types/Workflow.dhall
      sha256:d74d3fc66c52dd53a618ce8913920c09acba757e788faab624b11bc4158bae5c
, Push =
    ./types/events/Push.dhall
      sha256:5147b1dd6eca94aae5d217b979cac20ba64b7ec160488dd917f171cae451b135
, PullRequest =
    ./types/events/PullRequest.dhall
      sha256:0eaa196a5ed1c6659cb224a91bf235c5e837cf700e1f72f40957ba4674b6798d
, PullRequestReview =
    ./types/events/PullRequestReview.dhall
      sha256:f7a1d37a7fa9ce33f736813d132503dcf9c46a3fc72c7327c07d799af9f6ea63
, Delete =
    ./types/events/Delete.dhall
      sha256:0912602a19e01dcff30f351958d2d9b69519c9be61b57b1b32a2a569bf8bf5f9
, Concurrency =
    ./types/Concurrency.dhall
      sha256:76a98598b0b13d496c062d301b27c82059be340aae993285c6b345ec494a4913
, Permission =
    ./types/Permission.dhall
      sha256:b2a2f093af7412e34040a806e226ee4e7d691bd18df5c46bbfcc7cd222a37a2d
, PermissionAccess =
    ./types/PermissionAccess.dhall
      sha256:50f036b7dc434a4b2e7e847943fe5c31846bf38ec1795de8baafe76cfe6382b6
, Schedule =
    ./types/events/Schedule.dhall
      sha256:eb91edc996fadffb9cac1b67a4da220eed6bf54e96f7b8accbb613462e402537
, Input =
    ./types/Input.dhall
      sha256:4723eaffcfb407926dbda34ad46b0e4159885063a24aa26351fd86417a150c4a
, WorkflowDispatch =
    ./types/events/WorkflowDispatch.dhall
      sha256:6a5553c84dd7397eb24b3f94326d9ae9cfae04ace8fa55606319ee312d023ef8
, WorkflowRun =
    ./types/events/WorkflowRun.dhall
      sha256:63a3c3130a74d1af7e25a73b55ab719cda4a26ba0bfdee72214be7e43d23c46a
, Release =
    ./types/events/Release.dhall
      sha256:6dc17afaa0a74325dfd226bdc60d96e737978c8be500856b84d7075e869cad87
, Release/types =
    ./types/events/release/types.dhall
      sha256:7a43a2198599fb074e451d67c6afcdecf65205ffe909e1e702eb2f567d5f3889
, actions/HaskellSetup =
    ./types/actions/HaskellSetup.dhall
      sha256:3cfef5c383d40623d0766715715c881583623bf6e11a0ad0b9946d8eaeffa6c5
}
