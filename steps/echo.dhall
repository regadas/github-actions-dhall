let run = ./run.dhall

in    λ(args : { name : Text, what : Text })
    →   run { run = "echo ${args.what}" }
      ⫽ { id = None Text, name = Some args.name }
