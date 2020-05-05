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
}
