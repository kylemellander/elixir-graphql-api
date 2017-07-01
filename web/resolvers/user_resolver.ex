defmodule NoegenApi.UserResolver do
  alias NoegenApi.Repo
  alias NoegenApi.User

  def all(_args, _info) do
    {:ok, Repo.all(User)}
  end
end
