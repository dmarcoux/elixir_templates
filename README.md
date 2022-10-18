# <a href="https://github.com/dmarcoux/elixir_templates">dmarcoux/elixir_templates</a>

Templates for common files/configs I use in Elixir projects.

## nix-shell for Elixir and Phoenix

Reproducible development environment for Elixir and
[Phoenix](https://www.phoenixframework.org) projects which relies on
[Nix](https://github.com/NixOS/nix), a purely functional and cross-platform
package manager.

### Usage

1. Copy at the root of the Elixir/Phoenix project.
2. Start with `nix-shell --pure`.

## Docker-Compose for PostgreSQL

Setting up PostgreSQL inside nix-shell is cumbersome, so I prefer to rely on the
official Docker image for PostgreSQL.

### Usage

1. Copy at the root of the Elixir/Phoenix project.
2. Start with `docker-compose up`.
