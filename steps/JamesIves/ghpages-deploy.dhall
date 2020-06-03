let Step = ../../schemas/Step.dhall

in  λ(args : { branch : Text, folder : Text }) →
      Step::{
      , id = None Text
      , name = Some "Deploy 🚀"
      , uses = Some "JamesIves/github-pages-deploy-action@3.5.3"
      , run = None Text
      , with = Some
          ( toMap
              { ACCESS_TOKEN = "\${{ secrets.ACCESS_TOKEN }}"
              , BRANCH = args.branch
              , FOLDER = args.folder
              }
          )
      }
