# github-actions-dhall

Typecheck, template and modularize your Github Action definitions with [Dhall](https://github.com/dhall-lang).

## Usage

### Hello World

```js
let GithubActions = ../package.dhall

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
      - id: hello
        name: Hello World
        uses: "actions/hello-world-javascript-action@v1"
        with:
          who-to-greet: Mona the Octocat
      - id: echo
        name: "Echo the greeting's time"
        run: "echo 'The time was ${{ steps.hello.outputs.time }}.'"
name: Greeting
on:
  push: {}
```

### Scala

```js
let GithubActions = ../package.dhall

let matrix =
      toMap { java = [ "8.0.232", "11.0.5" ], scala = [ "2.11.12", "2.12.11" ] }

let setup =
      [ GithubActions.steps.checkout { name = "checkout master" }
      , GithubActions.steps.run
          { name = "generate cache key"
          , run =
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
    , on = GithubActions.On::{ push = Some GithubActions.Push::{=} }
    , jobs = toMap
        { checks = GithubActions.Job::{
          , name = "Checks"
          , runs-on = GithubActions.RunsOn.Type.ubuntu-latest
          , steps =
                setup
              # [ GithubActions.steps.java-setup
                    { name = "Java 11 setup", java-version = "11" }
                , GithubActions.steps.run
                    { name = "scalafmt"
                    , run = "sbt scalafmtCheckAll scalafmtSbtCheck"
                    }
                ]
          }
        , build = GithubActions.Job::{
          , name = "Build"
          , needs = Some [ "checks" ]
          , strategy = Some GithubActions.Strategy::{ matrix = matrix }
          , runs-on = GithubActions.RunsOn.Type.ubuntu-latest
          , steps =
                setup
              # [ GithubActions.steps.java-setup
                    { name = "Java \${{ matrix.scala}} setup"
                    , java-version = "\${{ matrix.scala}}"
                    }
                , GithubActions.steps.run
                    { name = "run tests"
                    , run = "sbt \"++\${{ matrix.scala}} test\""
                    }
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
      - id: checkout
        name: checkout master
        uses: "actions/checkout@v2.1.0"
      - name: generate cache key
        run: |
          shasum build.sbt \
            project/plugins.sbt \
            project/build.properties \
            project/Dependencies.scala > gha.cache.tmp
      - name: Java 11 setup
        uses: "actions/setup-java@v1"
        with:
          architecture: x64
          java-package: jdk
          java-version: '11'
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
      - name: run tests
        run: sbt test
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
      - id: checkout
        name: checkout master
        uses: "actions/checkout@v2.1.0"
      - name: generate cache key
        run: |
          shasum build.sbt \
            project/plugins.sbt \
            project/build.properties \
            project/Dependencies.scala > gha.cache.tmp
      - name: Java 11 setup
        uses: "actions/setup-java@v1"
        with:
          architecture: x64
          java-package: jdk
          java-version: '11'
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
      - name: scalafmt
        run: sbt scalafmtCheckAll scalafmtSbtCheck
    strategy:
      matrix:
        java:
          - '8.0.232'
          - '11.0.5'
        scala:
          - '2.11.12'
          - '2.12.11'
name: Greeting
on:
  push: {}
```
