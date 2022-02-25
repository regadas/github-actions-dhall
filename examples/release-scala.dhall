let GithubActions =
      https://raw.githubusercontent.com/regadas/github-actions-dhall/master/package.dhall
        sha256:53da2310a2e009556455a73684b997c3bd53192637ac3c77562c30e3815f5f23

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
            , url = "https://github.com"
            }
          , permissions = Some
              ( toMap
                  { GithubActions.types.Permission.id-token
                    = GithubActions.types.PermissionAccess.read
                  }
              )
          , runs-on = GithubActions.types.RunsOn.`ubuntu-18.04`
          , steps = setup
          }
        }
    }
