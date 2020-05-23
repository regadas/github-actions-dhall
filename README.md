# github-actions-dhall

Typecheck, template and modularize your Github Action definitions with [Dhall](https://github.com/dhall-lang).

## Usage

Import the `github actions` definitions as a `Dhall` package using:

```js
let GithubActions =
      https://raw.githubusercontent.com/regadas/github-actions-dhall/master/package.dhall sha256:b42b062af139587666185c6fb72cc2994aa85a30065324174760b7d29a9d81c9
```

[Workflow](https://github.com/regadas/github-actions-dhall/blob/da72bc0f4e90cd421af74498b027318b166f6882/types/Workflow.dhall) definition can be done by using the schema pattern and setting the appropriate values.

## Examples

### Hello World

```js
let GithubActions =
      https://raw.githubusercontent.com/regadas/github-actions-dhall/master/package.dhall sha256:b42b062af139587666185c6fb72cc2994aa85a30065324174760b7d29a9d81c9

let helloWorld =
      GithubActions.steps.helloWorld
        { name = "Hello World", who-to-greet = "Mona the Octocat" }

let echo =
      GithubActions.steps.echo
        { name = "Echo the greeting's time"
        , what = "'The time was \${{ steps.hello.outputs.time }}.'"
        }

in  GithubActions.Workflow::{
    , name = "Greeting"
    , on = GithubActions.On::{ push = Some GithubActions.Push::{=} }
    , jobs = toMap
        { build = GithubActions.Job::{
          , name = "Greeting"
          , runs-on = GithubActions.RunsOn.Type.ubuntu-latest
          , steps = [ helloWorld, echo ]
          }
        }
    }
```

```yaml
jobs:
  build:
    name: Greeting
    runs-on: ubuntu-latest
    steps:
      - name: Hello World
        uses: "actions/hello-world-javascript-action@v1"
        with:
          who-to-greet: Mona the Octocat
      - name: "Echo the greeting's time"
        run: "echo 'The time was ${{ steps.hello.outputs.time }}.'"
name: Greeting
on:
  push: {}
```

#### Try it!

```bash
curl https://raw.githubusercontent.com/regadas/github-actions-dhall/master/examples/hello-world.dhall | dhall-to-yaml
```

### Scala

```js
let GithubActions =
      https://raw.githubusercontent.com/regadas/github-actions-dhall/master/package.dhall sha256:b42b062af139587666185c6fb72cc2994aa85a30065324174760b7d29a9d81c99

let matrix =
      toMap { java = [ "8.0.232", "11.0.5" ], scala = [ "2.11.12", "2.12.11" ] }

let setup =
      [ GithubActions.steps.checkout
      , GithubActions.steps.run
          { run =
              ''
              shasum build.sbt \
                project/plugins.sbt \
                project/build.properties \
                project/Dependencies.scala > gha.cache.tmp
              ''
          }
      , GithubActions.steps.cache
          { path = "~/.sbt", key = "sbt", hashFile = "gha.cache.tmp" }
      , GithubActions.steps.cache
          { path = "~/.cache/coursier"
          , key = "coursier"
          , hashFile = "gha.cache.tmp"
          }
      ]

in  GithubActions.Workflow::{
    , name = "Greeting"
    , on = GithubActions.On::{
      , push = Some GithubActions.Push::{=}
      , pull_request = Some GithubActions.PullRequest::{=}
      }
    , jobs = toMap
        { checks = GithubActions.Job::{
          , name = "Checks"
          , runs-on = GithubActions.types.RunsOn.ubuntu-latest
          , steps =
                setup
              # [ GithubActions.steps.java-setup { java-version = "11" }
                , GithubActions.steps.run
                    { run = "sbt scalafmtCheckAll scalafmtSbtCheck" }
                ]
          }
        , build = GithubActions.Job::{
          , name = "Build"
          , needs = Some [ "checks" ]
          , strategy = Some GithubActions.Strategy::{ matrix = matrix }
          , runs-on = GithubActions.types.RunsOn.ubuntu-latest
          , steps =
                setup
              # [ GithubActions.steps.java-setup
                    { java-version = "\${{ matrix.scala}}" }
                , GithubActions.steps.run
                    { run = "sbt \"++\${{ matrix.scala}} test\"" }
                ]
          }
        }
    }

```

```yaml
jobs:
  build:
    name: Build
    needs:
      - checks
    runs-on: ubuntu-latest
    steps:
      - uses: "actions/checkout@v2.1.0"
      - run: |
          shasum build.sbt \
            project/plugins.sbt \
            project/build.properties \
            project/Dependencies.scala > gha.cache.tmp
      - name: "~/.sbt cache"
        uses: "actions/cache@v1"
        with:
          key: "${{ runner.os }}-sbt-${{ hashFiles('gha.cache.tmp') }}"
          path: "~/.sbt"
          restore-keys: sbt
      - name: "~/.cache/coursier cache"
        uses: "actions/cache@v1"
        with:
          key: "${{ runner.os }}-coursier-${{ hashFiles('gha.cache.tmp') }}"
          path: "~/.cache/coursier"
          restore-keys: coursier
      - name: "java ${{ matrix.scala}} setup"
        uses: "actions/setup-java@v1"
        with:
          architecture: x64
          java-package: jdk
          java-version: "${{ matrix.scala}}"
      - run: "sbt \"++${{ matrix.scala}} test\""
    strategy:
      matrix:
        java:
          - '8.0.232'
          - '11.0.5'
        scala:
          - '2.11.12'
          - '2.12.11'
  checks:
    name: Checks
    runs-on: ubuntu-latest
    steps:
      - uses: "actions/checkout@v2.1.0"
      - run: |
          shasum build.sbt \
            project/plugins.sbt \
            project/build.properties \
            project/Dependencies.scala > gha.cache.tmp
      - name: "~/.sbt cache"
        uses: "actions/cache@v1"
        with:
          key: "${{ runner.os }}-sbt-${{ hashFiles('gha.cache.tmp') }}"
          path: "~/.sbt"
          restore-keys: sbt
      - name: "~/.cache/coursier cache"
        uses: "actions/cache@v1"
        with:
          key: "${{ runner.os }}-coursier-${{ hashFiles('gha.cache.tmp') }}"
          path: "~/.cache/coursier"
          restore-keys: coursier
      - name: java 11 setup
        uses: "actions/setup-java@v1"
        with:
          architecture: x64
          java-package: jdk
          java-version: '11'
      - run: sbt scalafmtCheckAll scalafmtSbtCheck
name: Greeting
on:
  pull_request: {}
  push: {}
```

#### Try it!

```bash
curl https://raw.githubusercontent.com/regadas/github-actions-dhall/master/examples/scala.dhall | dhall-to-yaml
```

### Scala and sbt-ci-release

Have a look at the [release-scala.dhall](examples/release-scala.dhall) example.

```bash
curl https://raw.githubusercontent.com/regadas/github-actions-dhall/master/examples/release-scala.dhall | dhall-to-yaml
```
