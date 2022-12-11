defmodule ProgressiveRendering.Application do
  @moduledoc false

  use Application

  @impl true
  def start(_type, _args) do
    children = [
      {Bandit, plug: ProgressiveRendering.Router}
    ]

    opts = [strategy: :one_for_one, name: ProgressiveRendering.Supervisor]
    Supervisor.start_link(children, opts)
  end
end
