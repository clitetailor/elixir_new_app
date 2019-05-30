defmodule NewAppTest do
  use ExUnit.Case
  doctest NewApp

  test "bucket agent" do
    {:ok, bucket} = Bucket.new()

    bucket |> Bucket.add(5)
    bucket |> Bucket.add(6)

    assert bucket |> Bucket.get(1) == 6
  end
end
