defmodule NoegenApi.UserResolver do
  alias NoegenApi.Repo
  alias NoegenApi.User

  def all(_args, _info) do
    {:ok, Repo.all(User)}
  end

  def find(%{id: id}, _info) do
    find_user(id)
  end

  defp find_user(id) do
    case Repo.get(User, id) do
      nil -> {:error, "Not Found"}
      user -> {:ok, user}
    end
  end
end
