defmodule NoegenApi.UserResolver do
  alias NoegenApi.Repo
  alias NoegenApi.User

  def all(_args, %{context: %{current_user: _}}) do
    {:ok, Repo.all(User)}
  end

  def all(_args, _info) do
    {:error, "Unauthorized"}
  end

  def find(%{id: id}, _info) do
    find_user(id)
  end

  def current(_args, %{context: %{current_user: %{id: id}}}) do
    find_user(id)
  end

  def current(_args, _info) do
    {:error, "Not Found"}
  end

  def create(args, _info) do
    %User{}
      |> User.registration_changeset(args)
      |> Repo.insert
  end

  defp find_user(id) do
    case Repo.get(User, id) do
      nil -> {:error, "Not Found"}
      user -> {:ok, user}
    end
  end
end
