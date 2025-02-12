let GithubActions =
      https://regadas.dev/github-actions-dhall/package.dhall
        sha256:56b2d746cf5bf75b66276f5adaa057201bbe1ebf29836f4e35390e2a2bb68965

let checkoutMain =
      GithubActions.steps.actions/checkout
        GithubActions.actions/checkout::{
        , ref = Some "main"
        , fetch-depth = Some 0
        }

let checkoutPrivateRepo =
      GithubActions.steps.actions/checkout
        GithubActions.actions/checkout::{
        , repository = Some "myorg/private-repo"
        , path = Some "./private-repo"
        , token = Some "\${{ secrets.PAT_TOKEN }}"
        , sparse-checkout = Some
            ''
            src/
            docs/
            tests/
            ''
        , sparse-checkout-cone-mode = Some True
        }

let checkoutWithSubmodules =
      GithubActions.steps.actions/checkout
        GithubActions.actions/checkout::{
        , submodules = Some "recursive"
        , fetch-depth = Some 1
        , lfs = Some True
        }

in  GithubActions.Workflow::{
    , name = "Complex Checkout Example"
    , on = GithubActions.On::{
      , push = Some GithubActions.Push::{
        , branches = Some [ "main", "develop" ]
        , paths-ignore = Some [ "docs/**" ]
        }
      }
    , jobs = toMap
        { checkout-examples = GithubActions.Job::{
          , name = Some "Checkout Examples"
          , runs-on = GithubActions.types.RunsOn.ubuntu-latest
          , steps =
            [ checkoutMain, checkoutPrivateRepo, checkoutWithSubmodules ]
          }
        }
    }
