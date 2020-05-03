{ run =
    ./steps/run.dhall sha256:af85ca9d0241b27bc62308138d5faee66e4dc9b6dd90a308d8196d9543d2eb8c
, echo =
    ./steps/echo.dhall sha256:f599500ec17b6cc7f54b5d057a95ee01e0dc218966949ed6653c6f1509567f68
, checkout =
    ./steps/checkout.dhall sha256:e1a3e0bfb3214b239739a28cf0154122817dab32d4bd13f0e8fd97574654c5a1
, cache =
    ./steps/cache.dhall sha256:2adce92063eb76dede536c55d14ef11d5b293f454867ccdb1e348d00a5ce2ae7
, java-setup =
    ./steps/java-setup.dhall sha256:739b6662f82eed194818550d5f6b7750dff4726daad4bfe24e3ffd7f12f6ab5e
, helloWorld =
    ./steps/helloWorld.dhall sha256:d05ef6ea33f6530b79e5b787f0dbcb08a025278f03b0d5e43b0471a6dc30103f
}
