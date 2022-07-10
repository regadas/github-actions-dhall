# github-actions-dhall

Typecheck, template and modularize your Github Action definitions with [Dhall](https://github.com/dhall-lang).

## Usage

Import the `github actions` definitions as a `Dhall` package using:

```js
let GithubActions =
      https://regadas.dev/github-actions-dhall/package.dhall
```

[Workflow](types/Workflow.dhall) definition can be done by using the schema pattern and setting the appropriate values.

## Examples

- [hello-world.dhall](examples/hello-world.dhall)

```bash
curl https://regadas.dev/github-actions-dhall/examples/hello-world.dhall | dhall-to-yaml
```

- [scala.dhall](examples/scala.dhall)

```bash
curl https://regadas.dev/github-actions-dhall/examples/scala.dhall | dhall-to-yaml
```

- [release-scala.dhall](examples/release-scala.dhall)

```bash
curl https://regadas.dev/github-actions-dhall/examples/release-scala.dhall | dhall-to-yaml
```
