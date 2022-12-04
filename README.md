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

## nix-shell for Elixir and Phoenix

Reproducible development environment for Elixir/Phoenix projects which relies on
[Nix](https://github.com/NixOS/nix), a purely functional and cross-platform
package manager.

### Usage

1. Copy [shell.nix](./shell.nix) at the root of your Elixir/Phoenix project.
2. Add the content of [.gitignore](./.gitignore) to your own _.gitignore_.
3. Start with `nix-shell --pure`.

## Docker-Compose for PostgreSQL

Setting up PostgreSQL inside nix-shell is cumbersome, so relying on the official
Docker image for PostgreSQL is much simpler.

### Usage

1. Copy [docker-compose.yml](./docker-compose.yml) at the root of your
  Elixir/Phoenix project.
2. Start with `docker-compose up`.

## SQLite

To use SQLite instead of PostgreSQL, uncomment the line with the `sqlite`
package in [shell.nix](./shell.nix).

## Continuous Integration with [GitHub Actions](https://docs.github.com/en/actions)

Linters, tests and more. Details under [.github/workflows](./.github/workflows).

## [Dependabot](https://dependabot.com/)

Automated dependency updates. Details in the [config](./.github/dependabot.yml).
