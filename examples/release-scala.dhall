let GithubActions =
      ../package.dhall sha256:b42b062af139587666185c6fb72cc2994aa85a30065324174760b7d29a9d81c9

let setup =
      [ GithubActions.steps.checkout
      , GithubActions.steps.scala-setup
      , GithubActions.steps.gpg-setup
      , GithubActions.steps.sbt-ci-release
          { ref = "\${{ github.ref }}"
          , pgpPassphrase = "\${{ secrets.PGP_PASSPHRASE }}"
          , pgpSecret = "\${{ secrets.PGP_SECRET }}"
          , sonatypePassword = "\${{ secrets.SONATYPE_PASSWORD }}"
          , sonatypeUsername = "\${{ secrets.SONATYPE_USERNAME }}"
          }
      ]

in  GithubActions.Workflow::{
    , name = "Release"
    , on = GithubActions.On::{
      , push = Some GithubActions.Push::{
          , branches = Some [ "master" ]
          , tags = Some ["*"]
        }
      }
    , jobs = toMap
        { build = GithubActions.Job::{
          , name = "Publish"
          , needs = None (List Text)
          , runs-on = GithubActions.types.RunsOn.`ubuntu-18.04`
          , steps = setup
          }
        }
    }
