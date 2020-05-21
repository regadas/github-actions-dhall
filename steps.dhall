{ run =
    ./steps/run.dhall sha256:2743f316bf0fa45fc054aea9c842bf7dd81eacbf39b358f6a1a0c9731a879f83
, echo =
    ./steps/echo.dhall sha256:87329eab26c14eac330e20cf5830070cf952a0e7eab4c0d8634d417044213ca3
, checkout =
    ./steps/checkout.dhall sha256:d966e1771371e9a7aaef7f89cdcaaedd1d439679b7130ca276ecd3cd64125cce
, cache =
    ./steps/cache.dhall sha256:5db7e7c9393fb2856c7a1fd1bde71669893655b91dc092b961acc6570fb4e6ab
, java-setup =
    ./steps/java-setup.dhall sha256:42b26f0901beba4d060b809194f04b4055bbab33ea5503ce6270319df92adfca
, helloWorld =
    ./steps/helloWorld.dhall sha256:119e5f24031dd30ebf94b9a8c7cfda7ac1da271effff60dd9d7542f932ed5145
, gpg-setup =
    ./steps/gpg-setup.dhall sha256:d58e53f881fcd63053ac902fe97e842b56c00576adf93007c2a8a6370bb843f0
, sbt-ci-release =
    ./steps/sbt-ci-release.dhall sha256:e1a6e31166b6ced82265a1880991b3b5de55f8c325bc03da0e547f2abc7ef72b
}
