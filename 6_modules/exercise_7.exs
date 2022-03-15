# Get the value of env var in Elixir
System.fetch_env("SHELL")
# Return extension of filename in Elixir
Path.extname("exercise_6.exs")
# Return process's current working directory
File.cwd!()
# Convert a string containing JSON into Elixir data structures.
Poison
# Execute a command in your operating system’s shell.
System.cmd("ls", [])
