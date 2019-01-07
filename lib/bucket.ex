defmodule KV.Bucket do
  def start_link list do
    Agent.start_link fn -> %{} end
  end

  def get(bucket, key) do
    Agent.get(bucket, fn map -> map[String.to_atom(key)] end)
  end

  def put(bucket, key, value) do
    Agent.update(bucket, fn map -> Map.put(map, key, value) end)
  end
end
