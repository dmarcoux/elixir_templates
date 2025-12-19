# <a href="https://github.com/dmarcoux/elixir_templates">dmarcoux/elixir_templates</a>

Templates for common files/configs in
[Elixir](https://elixir-lang.org/)/[Phoenix](https://www.phoenixframework.org/)
projects.

## How to Use This Template

1. Create a new repository based on this repository:

- Go to this [repository's page](https://github.com/dmarcoux/elixir_templates),
  click on the `Use this template` button and follow instructions.

  *OR*

- With [GitHub's CLI](https://github.com/cli/cli), run `gh repo create
  NEW_REPOSITORY_NAME --template=dmarcoux/elixir_templates`.

2. Search for `CHANGEME` in the newly created repository to adapt it to your
   needs.

3. Pick nix-shell or Mise for the development environment.

## nix-shell for Elixir and Phoenix

Reproducible development environment for Elixir/Phoenix projects which relies on
[Nix](https://github.com/NixOS/nix), a purely functional and cross-platform
package manager.

### Usage

1. Copy [shell.nix](./shell.nix) at the root of your Elixir/Phoenix project.
2. Add the content of [.gitignore](./.gitignore) to your own _.gitignore_.
3. Start with `nix-shell`.

## Mise

Rely on [Mise](https://mise.jdx.dev/) to install tools, set environment
variables, and run tasks. Refer to [mise.toml](mise.toml) for details. The Mise
documentation is there to help you get started, there's no need to repeat it all
here. It boils down to activating Mise (_optional_), installing tools, and
running tasks.

Install tools with:

```bash
mise install
```

See available tasks with:

```bash
mise run
```

## SQLite

To use SQLite instead of PostgreSQL, uncomment the line with the `sqlite`
package in [shell.nix](./shell.nix).

## Continuous Integration with [GitHub Actions](https://docs.github.com/en/actions)

Linters, tests and more. Details under [.github/workflows](./.github/workflows).

## [Dependabot](https://dependabot.com/)

Automated dependency updates. Details in the [config](./.github/dependabot.yml).
