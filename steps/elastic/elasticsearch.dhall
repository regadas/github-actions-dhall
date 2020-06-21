let Step = ../../schemas/Step.dhall

in      \(args : { stack-version : Text, nodes : Optional Natural })
    ->  let nodes-vars =
              merge
                { None = [] : List { mapKey : Text, mapValue : Text }
                , Some =
                    \(nodes : Natural) -> toMap { nodes = Natural/show nodes }
                }
                args.nodes

        in  Step::{
            , id = None Text
            , name = Some "Runs elasticsearch version ${args.stack-version}"
            , uses = Some "elastic/elastic-github-actions/elasticsearch@master"
            , run = None Text
            , with = Some
                (toMap { stack-version = args.stack-version } # nodes-vars)
            }
