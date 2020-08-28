let GithubActions =
      https://raw.githubusercontent.com/regadas/github-actions-dhall/master/package.dhall sha256:cc677589e6d7e13705d106ec6b90cbaa643942b2721ec30af6e256cfcdc925ed

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
          , needs = None (List Text)
          , runs-on = GithubActions.types.RunsOn.`ubuntu-18.04`
          , steps = setup
          }
        }
    }
