let Step = ../../schemas/Step.dhall

in  Step::{
    , id = None Text
    , name = Some "Publish \${{ github.ref }}"
    , uses = None Text
    , run = Some "sbt ci-release"
    , env = Some
        ( toMap
            { PGP_PASSPHRASE = "\${{ secrets.PGP_PASSPHRASE }}"
            , PGP_SECRET = "\${{ secrets.PGP_SECRET }}"
            , SONATYPE_PASSWORD = "\${{ secrets.SONATYPE_PASSWORD }}"
            , SONATYPE_USERNAME = "\${{ secrets.SONATYPE_USERNAME }}"
            }
        )
    }
