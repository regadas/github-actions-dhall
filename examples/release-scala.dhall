let GithubActions =
      https://raw.githubusercontent.com/regadas/github-actions-dhall/master/package.dhall sha256:06e487b9ad805b241c3f01a09a3fddb4db1eb2b51f95cda2c99f63ad56dd607e

let setup =
      [ GithubActions.steps.checkout
      , GithubActions.steps.olafurpg/java-setup { java-version = "11" }
      , GithubActions.steps.olafurpg/gpg-setup
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
          , needs = None (List Text)
          , runs-on = GithubActions.types.RunsOn.`ubuntu-18.04`
          , steps = setup
          }
        }
    }
