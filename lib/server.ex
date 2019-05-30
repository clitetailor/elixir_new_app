defmodule Server do
  use GenServer

  def start_link(opts) do
    GenServer.start_link(Server, :ok, opts)
  end

  def add(server, value) do
    GenServer.call(server, {:add, value})
  end

  @impl true
  def init(:ok) do
    {:ok, 0}
  end

  @impl true
  def handle_call({:add, value}, _from, state) do
    sum = state + value
    {:reply, sum, sum}
  end

  @impl true
  def handle_cast(_request, state) do
    {:noreply, state}
  end
end
