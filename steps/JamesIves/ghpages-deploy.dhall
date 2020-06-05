let Step = ../../schemas/Step.dhall

let AuthSchema = < AccessToken | GithubToken | Ssh >

let auth =
      λ(authSchema : AuthSchema) →
        merge
          { AccessToken = toMap
              { ACCESS_TOKEN = "\${{ secrets.ACCESS_TOKEN }}" }
          , GithubToken = toMap
              { GITHUB_TOKEN = "\${{ secrets.GITHUB_TOKEN }}" }
          , Ssh = toMap { SSH = "true" }
          }
          authSchema

in  λ(args : { authSchema : AuthSchema, branch : Text, folder : Text }) →
      Step::{
      , id = None Text
      , name = Some "Deploy 🚀"
      , uses = Some "JamesIves/github-pages-deploy-action@3.5.3"
      , run = None Text
      , with = Some
          (   toMap { BRANCH = args.branch, FOLDER = args.folder }
            # auth args.authSchema
          )
      }
