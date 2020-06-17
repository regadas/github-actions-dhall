let GithubActions =
      https://raw.githubusercontent.com/regadas/github-actions-dhall/master/package.dhall sha256:8efe6772e27f99ed3a9201b4e45c68eeaaf82c349e70d36fbe89185a324f6519

let matrix =
      toMap { java = [ "8.0.232", "11.0.5" ], scala = [ "2.11.12", "2.12.11" ] }

let setup =
      [ GithubActions.steps.checkout
      , GithubActions.steps.run
          { run =
              ''
              shasum build.sbt \
                project/plugins.sbt \
                project/build.properties \
                project/Dependencies.scala > gha.cache.tmp
              ''
          }
      , GithubActions.steps.cache
          { path = "~/.sbt", key = "sbt", hashFile = "gha.cache.tmp" }
      , GithubActions.steps.cache
          { path = "~/.cache/coursier"
          , key = "coursier"
          , hashFile = "gha.cache.tmp"
          }
      ]

in  GithubActions.Workflow::{
    , name = "Greeting"
    , on = GithubActions.On::{
      , push = Some GithubActions.Push::{=}
      , pull_request = Some GithubActions.PullRequest::{=}
      }
    , jobs = toMap
        { checks = GithubActions.Job::{
          , name = Some "Checks"
          , runs-on = GithubActions.types.RunsOn.ubuntu-latest
          , steps =
                setup
              # [ GithubActions.steps.java-setup { java-version = "11" }
                , GithubActions.steps.run
                    { run = "sbt scalafmtCheckAll scalafmtSbtCheck" }
                ]
          }
        , build = GithubActions.Job::{
          , name = Some "Build"
          , needs = Some [ "checks" ]
          , strategy = Some GithubActions.Strategy::{ matrix }
          , runs-on = GithubActions.types.RunsOn.ubuntu-latest
          , steps =
                setup
              # [ GithubActions.steps.java-setup
                    { java-version = "\${{ matrix.scala}}" }
                , GithubActions.steps.run
                    { run = "sbt \"++\${{ matrix.scala}} test\"" }
                ]
          }
        }
    }
