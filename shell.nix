# To ensure this nix-shell is reproducible, we pin the packages index to a commit SHA taken from a channel on https://status.nixos.org/
# This commit is from NixOS 22.05
with (import (fetchTarball https://github.com/NixOS/nixpkgs/archive/8de8b98839d1f20089582cfe1a81207258fcc1f1.tar.gz) {});

let
  erlang = beam.packages.erlangR25;
in
  mkShell {
    buildInputs = [
      # Elixir with Erlang/OTP specified in the `erlang` variable (relying on the package `elixir` alone isn't enough, as the version of Erlang cannot be specified)
      erlang.elixir_1_14
      # The package manager for Erlang
      erlang.hex
      # The build tool for Erlang
      erlang.rebar3 # If changing this package, do not forget to replicate the change below in `shellHook`
      # For the Live Reloading feature in Phoenix
      inotify-tools
      # Database SQLite
      # sqlite
      # Locales
      glibcLocales
    ];

    shellHook = ''
      # Set LANG for locales, otherwise it is unset when running "nix-shell --pure"
      export LANG="C.UTF-8"

      # Keep Mix and Hex data in the project (Be sure to ignore those directories in `.gitignore`)
      export MIX_HOME="$PWD/.nix-mix"
      export HEX_HOME="$PWD/.nix-hex"
      mkdir -p "$MIX_HOME" "$HEX_HOME"
      # Put executables from Mix and Hex directories in $PATH
      export PATH="$MIX_HOME/bin:$MIX_HOME/escripts:$HEX_HOME/bin:$PATH"

      # Set development environment for Mix
      export MIX_ENV=dev

      # Persist history of the IEx (Elixir) and erl (Erlang) shells
      export ERL_AFLAGS="-kernel shell_history enabled"

      # Set the path to the rebar3 package from Nix
      mix local.rebar --if-missing rebar3 ${erlang.rebar3}/bin/rebar3

      # Install the Phoenix application generator - https://hex.pm/packages/phx_new
      mix archive.install --force hex phx_new 1.6.14
    '';

    # Without this, there are warnings about LANG, LC_ALL and locales.
    # Many tests fail due those warnings showing up in test outputs too...
    # This solution is from: https://gist.github.com/aabs/fba5cd1a8038fb84a46909250d34a5c1
    LOCALE_ARCHIVE = "${glibcLocales}/lib/locale/locale-archive";
  }
