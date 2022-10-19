# <a href="https://github.com/dmarcoux/elixir_templates">dmarcoux/elixir_templates</a>

Templates for common files/configs in
[Elixir](https://elixir-lang.org/)/[Phoenix](https://www.phoenixframework.org/)
projects.

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
