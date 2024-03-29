# To ensure this nix-shell is reproducible, we pin the packages index to a commit SHA taken from a channel on https://status.nixos.org/
# This commit is from nixpkgs-unstable, it's somewhere between NixOS 23.05 and the following version
with (import (fetchTarball https://github.com/NixOS/nixpkgs/archive/b5f8ec6be261dfc44c3b56b220e2793d1b61512b.tar.gz) {});

let
  # Define variables for packages which are referenced more than once in this nix-shell
  erlang = beam.packages.erlangR26;
  rebar3 = erlang.rebar3;
  # CHANGEME: Remove the next line if you don't need Sass
  sass = dart-sass;
in
  mkShell {
    buildInputs = [
      # Elixir with Erlang/OTP specified in the `erlang` variable (relying on the package `elixir` alone isn't enough, as the version of Erlang cannot be specified)
      erlang.elixir_1_15
      # The package manager for Erlang
      erlang.hex
      # The build tool for Erlang
      rebar3
      # CHANGEME: Uncomment this package if you develop Phoenix applications, otherwise delete this.
      # For the Live Reloading feature in Phoenix
      # inotify-tools
      # CHANGEME: Uncomment this package if you develop applications with SQLite, otherwise delete this.
      # Database SQLite
      # sqlite
      # Locales
      glibcLocales
      # Install certificates to prevent SSL errors
      cacert
    ];

    shellHook = ''
      # Set LANG for locales, otherwise it is unset when running "nix-shell --pure"
      export LANG="C.UTF-8"

      # Remove duplicate commands from Bash shell command history
      export HISTCONTROL=ignoreboth:erasedups

      # Keep Mix and Hex data in the project (Be sure to ignore those directories in `.gitignore`)
      export MIX_HOME="$PWD/.nix-mix"
      export HEX_HOME="$PWD/.nix-hex"
      mkdir -p "$MIX_HOME" "$HEX_HOME"
      # Put executables from Mix and Hex directories in $PATH
      export PATH="$MIX_HOME/bin:$MIX_HOME/escripts:$HEX_HOME/bin:$PATH"

      # Persist history of the IEx (Elixir) and erl (Erlang) shells
      export ERL_AFLAGS="-kernel shell_history enabled"

      # Set the path to the rebar3 package from Nix
      mix local.rebar --if-missing rebar3 ${rebar3}/bin/rebar3

      # CHANGEME: Remove the `export MIX_SASS_*` lines if you don't need Sass
      # Set environment variables which we use in Phoenix's configuration (`config/config.exs`) for dart-sass
      # Example:
      #
      # config :dart_sass,
      #   version: System.get_env("MIX_SASS_VERSION"),
      #   path: System.get_env("MIX_SASS_PATH"),
      #   (...)
      export MIX_SASS_PATH="${sass}/bin/sass"
      export MIX_SASS_VERSION="1.62.1" # The version can be found in $MIX_SASS_PATH
    '';

    # Without this, there are warnings about LANG, LC_ALL and locales.
    # Many tests fail due those warnings showing up in test outputs too...
    # This solution is from: https://gist.github.com/aabs/fba5cd1a8038fb84a46909250d34a5c1
    LOCALE_ARCHIVE = "${glibcLocales}/lib/locale/locale-archive";
  }
