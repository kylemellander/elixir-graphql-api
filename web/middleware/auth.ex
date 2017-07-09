defmodule NoegenApi.Middleware.Auth do
  @behaviour Absinthe.Middleware
  def call(resolution = %{context: %{current_user: _}}, _config) do
    resolution
  end

  def call(resolution, _config) do
    resolution
    |> Absinthe.Resolution.put_result({:error, "unauthenticated"})
  end
end
