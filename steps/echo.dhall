let run = ./run.dhall

in    λ(args : { name : Text, what : Text })
    → run { name = args.name, run = "echo ${args.what}" } ⫽ { id = Some "echo" }
