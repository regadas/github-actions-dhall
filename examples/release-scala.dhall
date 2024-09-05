let GithubActions =
      https://regadas.dev/github-actions-dhall/package.dhall
        sha256:dfb18adac8746b64040c5387d51769177ce08a2d2a496da2446eb244f34cc21e

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
