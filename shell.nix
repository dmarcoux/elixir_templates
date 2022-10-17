# To ensure this nix-shell is reproducible, we pin the packages index to a commit SHA taken from a channel on https://status.nixos.org/
# This commit is from NixOS 22.05
with (import (fetchTarball https://github.com/NixOS/nixpkgs/archive/8de8b98839d1f20089582cfe1a81207258fcc1f1.tar.gz) {});

mkShell {
  buildInputs = [
    # Elixir 1.14 with Erlang/OTP 25 (relying on the package `elixir_1_14` alone isn't enough, as the version of Erlang cannot be specified)
    beam.packages.erlangR25.elixir_1_14
    # For the Live Reloading feature in Phoenix
    inotify-tools
    # Database PostgreSQL
    postgresql_14
    # Database SQLite
    # sqlite
    # Locales
    glibcLocales
  ];

  shellHook = ''
    # Set LANG for locales, otherwise it is unset when running "nix-shell --pure"
    export LANG="C.UTF-8"

    # Set development environment for Mix
    export MIX_ENV=dev

    # Install Hex
    mix local.hex --force

    # Install the Phoenix application generator
    mix archive.install --force hex phx_new
  '';

  # Without this, there are warnings about LANG, LC_ALL and locales.
  # Many tests fail due those warnings showing up in test outputs too...
  # This solution is from: https://gist.github.com/aabs/fba5cd1a8038fb84a46909250d34a5c1
  LOCALE_ARCHIVE = "${glibcLocales}/lib/locale/locale-archive";
}
