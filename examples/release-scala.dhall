let GithubActions =
      https://raw.githubusercontent.com/regadas/github-actions-dhall/master/package.dhall sha256:c0a9ee656aa2eb0b46828a22a48e7a8c63c9c9689153a09d34f8fac7cd8d2736

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
