defmodule NoegenApi.PageController do
  use NoegenApi.Web, :controller

  def index(conn, _params) do
    render conn, "index.html"
  end
end
