let Step = ../../schemas/Step.dhall

let AuthSchema = ./AuthSchema.dhall

let auth =
      λ(authSchema : AuthSchema) →
        merge
          { accessToken = toMap
              { ACCESS_TOKEN = "\${{ secrets.ACCESS_TOKEN }}" }
          , githubToken = toMap
              { GITHUB_TOKEN = "\${{ secrets.GITHUB_TOKEN }}" }
          , ssh = toMap { SSH = "true" }
          }
          authSchema

in  λ ( args
      : { authSchema : AuthSchema, branch : Text, folder : Text, opts : {} }
      ) →
      Step::{
      , id = None Text
      , name = Some "Deploy 🚀"
      , uses = Some "JamesIves/github-pages-deploy-action@3.5.3"
      , run = None Text
      , with = Some
          (   toMap ({ BRANCH = args.branch, FOLDER = args.folder } ∧ args.opts)
            # auth args.authSchema
          )
      }
