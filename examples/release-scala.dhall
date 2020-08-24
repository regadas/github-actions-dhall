let GithubActions =
      https://raw.githubusercontent.com/regadas/github-actions-dhall/master/package.dhall sha256:71caf8ceb1cf2a79053ed53991ab75dd8ee7905c33fe81a85f0226c6ca59900d

let setup =
      [ GithubActions.steps.actions/checkout
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
