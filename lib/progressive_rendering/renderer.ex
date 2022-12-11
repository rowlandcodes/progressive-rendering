defmodule ProgressiveRendering.Renderer do
  alias ProgressiveRendering.NetworkHelper
  @path Path.join(__DIR__, "../../views/partials")
  defp read(file), do: File.read!(Path.join(@path, file))

  def doctype, do: read("1-DOCTYPE.html")
  def open_html, do: read("2-openHTML.html")
  def head, do: read("3-head-progressive.html")
  def head_static, do: read("3-head-static.html")
  def open_body, do: read("4-openBody.html")
  def header, do: read("5-header.html")
  def content_open, do: read("6-contentOpen.html")
  def columns_open, do: read("7-columnsOpen.html")

  def column_one do
    NetworkHelper.simulate_network_latency(NetworkHelper.column_one_latency())

    read("8-columnOne.html")
  end

  def column_two do
    NetworkHelper.simulate_network_latency(NetworkHelper.column_two_latency())

    read("9-columnTwo.html")
  end

  def column_three do
    NetworkHelper.simulate_network_latency(NetworkHelper.column_three_latency())

    read("10-columnThree.html")
  end

  def column_four do
    NetworkHelper.simulate_network_latency(NetworkHelper.column_four_latency())

    read("11-columnFour.html")
  end

  def column_five do
    ProgressiveRendering.NetworkHelper.simulate_network_latency(
      ProgressiveRendering.NetworkHelper.column_five_latency()
    )

    read("12-columnFive.html")
  end

  def columns_close, do: read("13-columnsClose.html")
  def content_close, do: read("14-contentClose.html")
  def close_body, do: read("15-closeBody.html")
  def close_HTML, do: read("16-closeHTML.html")
end
