let GithubActions =
      https://regadas.dev/github-actions-dhall/package.dhall
        sha256:2158334802ab676603b64da3920bc2309ceb379312785ba56763dd9646da60a0

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
