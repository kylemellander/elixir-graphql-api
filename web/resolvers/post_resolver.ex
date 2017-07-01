defmodule NoegenApi.PostResolver do
  alias NoegenApi.Repo
  alias NoegenApi.Post

  def all(_args, _info) do
    {:ok, Repo.all(Post)}
  end
end
