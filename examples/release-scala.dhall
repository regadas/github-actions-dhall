let GithubActions =
      https://regadas.dev/github-actions-dhall/package.dhall
        sha256:3af4c42342006a960fde1018fbcbe3333abd0fd3b108c0888f7cd5ff35937032

let setup =
      [ GithubActions.steps.actions/checkout
      , GithubActions.steps.olafurpg/setup-java { java-version = "11" }
      , GithubActions.steps.olafurpg/setup-gpg
      , GithubActions.steps.olafurpg/sbt-ci-release
      ]

in  GithubActions.Workflow::{
    , name = "Release"
    , on = GithubActions.On::{
      , push = Some GithubActions.Push::{
        , branches = Some [ "master" ]
        , tags = Some [ "*" ]
        }
      }
    , jobs = toMap
        { build = GithubActions.Job::{
          , name = Some "Publish"
          , environment = Some GithubActions.JobEnv::{
            , name = "production"
            , url = Some "https://github.com"
            }
          , permissions = Some
            [ { mapKey = GithubActions.types.Permission.id-token
              , mapValue = GithubActions.types.PermissionAccess.read
              }
            ]
          , runs-on = GithubActions.types.RunsOn.`ubuntu-18.04`
          , steps = setup
          }
        }
    }
