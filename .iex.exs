# Import the global configuration for IEx if it's present, so anybody can keep
# their custom IEx configuration on top of project-specific configurations.
File.exists?(Path.expand("~/.iex.exs")) && import_file("~/.iex.exs")

# Add project-specific configuration here...
