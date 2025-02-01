{ run =
    ./steps/run.dhall
      sha256:1ed6d8f02429df6620ffa02b3118aebb08f1473413ea1f8cea1fedddf23296fe
, echo =
    ./steps/echo.dhall
      sha256:3606d47244c51259f4d1b4761cf55a38fca1f72de1bc06db55be0c38068e3f86
, actions/checkout =
    ./steps/actions/checkout.dhall
      sha256:a65f084b2844dd128664a7705f98dac51670d1c869700f4eb6c8ee11d0b0d9a7
, actions/cache =
    ./steps/actions/cache.dhall
      sha256:b6d6702a9faa91b3b64f9ac7e84b1f8706a460dd02fcf2e47cbbedb9053e6e96
, actions/helloWorld =
    ./steps/actions/helloWorld.dhall
      sha256:69bc163d0b30165fb1792c23871a0ad6fade1095517f6b3fa3b834a615f3d2fc
, actions/setup-haskell =
    ./steps/actions/setup-haskell.dhall
      sha256:64832d56eca122c4f5d1fc11dbe1e1a442b5a370b4aa415c96477d256f5ec2e0
, actions/setup-java =
    ./steps/actions/setup-java.dhall
      sha256:2971bd13d0d93c5f1d7b1c215fa092ceb87c11ed9e37dc03de36587b1b5b2179
, cachix/cachix =
    ./steps/cachix/cachix.dhall
      sha256:a3d2850422b4859788d50b826e87be42d04604b3644bc797537f8e6494038213
, cachix/install-nix =
    ./steps/cachix/install-nix.dhall
      sha256:38a071cb582ba996144bc227a2cbfd83aebdd7ea23f7467567be11d5b2a737f2
, elastic/elasticsearch =
    ./steps/elastic/elasticsearch.dhall
      sha256:0448933c1cf549cda85e1fad9393a3ddfd3c5836c3a2a542cb19e213eafb5b32
, JamesIves/ghpages-deploy =
    ./steps/JamesIves/ghpages-deploy.dhall
      sha256:a058045ee65b3d264c5c5747f81091f5fc77ecf05b7dc7939d3ca2efa37c8151
, olafurpg/sbt-ci-release =
    ./steps/olafurpg/sbt-ci-release.dhall
      sha256:43246791d7008b7d02f6767e155b3cca89c3ba0c3e6d9865c2554cf4e2d1ed38
, olafurpg/setup-java =
    ./steps/olafurpg/setup-java.dhall
      sha256:05f40edbad1a9b3e4b2aed049c18ae0b9b40b678fa066af34a40f68f5685e4f0
, olafurpg/setup-gpg =
    ./steps/olafurpg/setup-gpg.dhall
      sha256:c50355ce97b750ed213dfb4680e84d42639f022aa1c3c440fa2879337832264d
}
