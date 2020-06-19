{ run =
    ./steps/run.dhall sha256:2743f316bf0fa45fc054aea9c842bf7dd81eacbf39b358f6a1a0c9731a879f83
, echo =
    ./steps/echo.dhall sha256:87329eab26c14eac330e20cf5830070cf952a0e7eab4c0d8634d417044213ca3
, checkout =
    ./steps/checkout.dhall sha256:d966e1771371e9a7aaef7f89cdcaaedd1d439679b7130ca276ecd3cd64125cce
, cache =
    ./steps/cache.dhall sha256:5db7e7c9393fb2856c7a1fd1bde71669893655b91dc092b961acc6570fb4e6ab
, java-setup =
    ./steps/java-setup.dhall sha256:d2f618e66d0e2f841ef043fe16501cef5ffdf412fd7d4bd74f3f922cab745568
, helloWorld =
    ./steps/helloWorld.dhall sha256:119e5f24031dd30ebf94b9a8c7cfda7ac1da271effff60dd9d7542f932ed5145
, actions/checkout =
    ./steps/actions/checkout.dhall sha256:d966e1771371e9a7aaef7f89cdcaaedd1d439679b7130ca276ecd3cd64125cce
, actions/cache =
    ./steps/actions/cache.dhall sha256:5db7e7c9393fb2856c7a1fd1bde71669893655b91dc092b961acc6570fb4e6ab
, actions/java-setup =
    ./steps/actions/java-setup.dhall sha256:d2f618e66d0e2f841ef043fe16501cef5ffdf412fd7d4bd74f3f922cab745568
, actions/helloWorld =
    ./steps/actions/helloWorld.dhall sha256:119e5f24031dd30ebf94b9a8c7cfda7ac1da271effff60dd9d7542f932ed5145
, cachix/cachix =
    ./steps/cachix/cachix.dhall sha256:314d2cb8ee42d0d1d39b2da55c9d01d1b9913566c1e929c28c38aa88ea6ffe12
, cachix/install-nix =
    ./steps/cachix/install-nix.dhall sha256:13781516a660a5ab7862b0dfc63913dd2b9461f038717a05f5ff7ee12ea171a9
, elastic/elasticsearch =
    ./steps/elastic/elasticsearch.dhall sha256:79ebe54702d4ca19b45c0db9d73899cf93c60886cd3571fcc4320cd8d49f4dff
, JamesIves/ghpages-deploy =
    ./steps/JamesIves/ghpages-deploy.dhall sha256:d616c73848cfd3608f3d89e77b2c463b671dbfcfadc5be18a58fbd3397a16283
, olafurpg/java-setup =
    ./steps/olafurpg/java-setup.dhall sha256:8ccb6ba97ce3b68401bdff04ed9dde29375d456e2f3fdf293832e6fa9c0f59a1
, olafurpg/gpg-setup =
    ./steps/olafurpg/gpg-setup.dhall sha256:d58e53f881fcd63053ac902fe97e842b56c00576adf93007c2a8a6370bb843f0
, olafurpg/sbt-ci-release =
    ./steps/olafurpg/sbt-ci-release.dhall sha256:28b676449303888dbb028ad960e587004e761c0afa283cf4d5bce0d4eafb2288
}
