# Import the global configuration for IEx if it's present, so anybody can keep
# their custom IEx configuration on top of project-specific configurations.
import_file_if_available("~/.iex.exs")

# Automatically reload code changes after code has been recompiled.
# Combine this with Mise task `watch-compile` to automatically recompile code when a file changes.
IEx.configure(auto_reload: true)

# Add project-specific configuration here...
