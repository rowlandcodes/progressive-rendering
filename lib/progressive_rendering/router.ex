defmodule ProgressiveRendering.Router do
  use Plug.Router

  plug Plug.Static, at: "/", from: "public"
  plug(:match)
  plug(:dispatch)
  plug(:simulate_network_latency)

  get "/newspaper" do
    ProgressiveRendering.Newspaper.render(conn)
  end

  get "/newspaper/stream" do
    ProgressiveRendering.Newspaper.async_render(conn)
  end

  match _ do
    send_resp(conn, 404, "oops")
  end

  def simulate_network_latency(conn, _opts) do
    ProgressiveRendering.NetworkHelper.simulate_network_latency(300)
    conn
  end
end
