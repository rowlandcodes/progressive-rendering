defmodule ProgressiveRendering.Newspaper do
  import Plug.Conn
  alias ProgressiveRendering.Renderer

  def render(conn) do
    body = static_all_page_parts() |> Enum.map(fn e -> e.() end) |> Enum.join("\n")
    send_resp(conn, 200, body)
  end

  def async_render(conn) do
    conn = send_chunked(conn, 200)

      progressive_all_page_parts()
      |> Enum.map(&Task.async/1)
      |> Enum.reduce_while(conn, fn (pid, conn) ->
        result = Task.await(pid, 30_000)
        case Plug.Conn.chunk(conn, result) do
          {:ok, conn} ->
            {:cont, conn}

          {:error, :closed} ->
            {:halt, conn}
        end
      end)
  end

  defp progressive_all_page_parts do
    [
      &Renderer.doctype/0,
      &Renderer.open_html/0,
      &Renderer.head/0,
      &Renderer.open_body/0,
      &Renderer.header/0,
      &Renderer.content_open/0,
      &Renderer.columns_open/0,
      &Renderer.column_one/0,
      &Renderer.column_two/0,
      &Renderer.column_three/0,
      &Renderer.column_four/0,
      &Renderer.column_five/0,
      &Renderer.columns_close/0,
      &Renderer.content_close/0,
      &Renderer.close_body/0,
      &Renderer.close_HTML/0
    ]
  end

  defp static_all_page_parts do
    [
      &Renderer.doctype/0,
      &Renderer.open_html/0,
      &Renderer.head_static/0,
      &Renderer.open_body/0,
      &Renderer.header/0,
      &Renderer.content_open/0,
      &Renderer.columns_open/0,
      &Renderer.column_one/0,
      &Renderer.column_two/0,
      &Renderer.column_three/0,
      &Renderer.column_four/0,
      &Renderer.column_five/0,
      &Renderer.columns_close/0,
      &Renderer.content_close/0,
      &Renderer.close_body/0,
      &Renderer.close_HTML/0
    ]
  end
end
