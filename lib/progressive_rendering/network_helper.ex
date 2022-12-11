defmodule ProgressiveRendering.NetworkHelper do
  @latency_factor 5

  def column_one_latency, do: 200
  def column_two_latency, do: 200
  def column_three_latency, do: 100
  def column_four_latency, do: 300
  def column_five_latency, do: 400

  def simulate_network_latency(), do: :timer.sleep(100 * @latency_factor)
  def simulate_network_latency(ms), do: :timer.sleep(ms * @latency_factor)
end
