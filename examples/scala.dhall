let GithubActions = ../package.dhall

let matrix =
      toMap { java = [ "8.0.232", "11.0.5" ], scala = [ "2.11.12", "2.12.11" ] }

let setup =
      [ GithubActions.steps.checkout { name = "checkout master" }
      , GithubActions.steps.run
          { name = "generate cache key"
          , run =
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
    , on = GithubActions.On::{ push = Some GithubActions.Push::{=} }
    , jobs = toMap
        { checks = GithubActions.Job::{
          , name = "Checks"
          , runs-on = GithubActions.RunsOn.Type.ubuntu-latest
          , steps =
                setup
              # [ GithubActions.steps.java-setup
                    { name = "Java 11 setup", java-version = "11" }
                , GithubActions.steps.run
                    { name = "scalafmt"
                    , run = "sbt scalafmtCheckAll scalafmtSbtCheck"
                    }
                ]
          }
        , build = GithubActions.Job::{
          , name = "Build"
          , needs = Some [ "checks" ]
          , strategy = Some GithubActions.Strategy::{ matrix = matrix }
          , runs-on = GithubActions.RunsOn.Type.ubuntu-latest
          , steps =
                setup
              # [ GithubActions.steps.java-setup
                    { name = "Java \${{ matrix.scala}} setup"
                    , java-version = "\${{ matrix.scala}}"
                    }
                , GithubActions.steps.run
                    { name = "run tests"
                    , run = "sbt \"++\${{ matrix.scala}} test\""
                    }
                ]
          }
        }
    }
