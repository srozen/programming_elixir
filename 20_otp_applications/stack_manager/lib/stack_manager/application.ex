defmodule StackManager.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  def start(_type, initial_stack) do
    # List all child processes to be supervised
    children = [
      {StackManager.Stash, initial_stack},
      {StackManager.Server, nil},
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: StackManager.Supervisor]
    Supervisor.start_link(children, opts)
  end
end