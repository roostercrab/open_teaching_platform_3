defmodule Plug.Supervisor do
  @moduledoc false

  def start_link() do
    Supervisor.start_link(__MODULE__, :ok, name: __MODULE__)
  end

  def init(:ok) do
    children = [
      Plug.Upload
    ]

    # While Plug.Crypto provides its own cache, Plug ship its own too,
    # both to keep storages separate and for backwards compatibility.
    Plug.Keys = :ets.new(Plug.Keys, [:named_table, :public, read_concurrency: true])
    Supervisor.init(children, strategy: :one_for_one)
  end
end
