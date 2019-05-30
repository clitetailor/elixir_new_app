defmodule ServerTest do
  use ExUnit.Case

  setup do
    server = start_supervised!(Server, [])

    %{server: server}
  end

  test "genserver server", %{server: server} do
    server |> Server.add(5)
    server |> Server.add(6)

    assert server |> Server.add(0) == 11
  end
end
