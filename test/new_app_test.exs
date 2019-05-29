defmodule NewAppTest do
  use ExUnit.Case
  doctest NewApp

  test "bucket agent" do
    {:ok, bucket} = Bucket.new()

    bucket
    |> Bucket.add(5)
    |> Bucket.add(6)

    assert Bucket.get(bucket, 1) == 6
  end
end
