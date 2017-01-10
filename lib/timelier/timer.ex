defmodule Timelier.Timer do
  use GenServer

  @name __MODULE__

  def start_link() do
    GenServer.start_link(__MODULE__, [], name: @name)
  end

  def init([]) do
    {:ok, [], 0}
  end

  def handle_info(:timeout, state) do
    Timelier.check()
    {:noreply, state, 60000}
  end
end
