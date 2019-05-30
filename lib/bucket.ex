defmodule Bucket do
  use Agent

  def new do
    Agent.start_link(fn -> [] end, [])
  end

  def get(bucket, key) do
    Agent.get(bucket, &Enum.at(&1, key))
  end

  def add(bucket, value) do
    Agent.update(bucket, &(&1 ++ [value]))
  end
end
