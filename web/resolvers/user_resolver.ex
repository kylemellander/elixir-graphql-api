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

  def create(args, _info) do
    changeset = register_changeset(args)
    case Repo.insert(changeset) do
      {:error, changeset} -> {:error, format_errors(changeset.errors)}
      {:ok, user} -> {:ok, user}
    end
  end

  def login(args, _info) do
    with {:ok, user} <- NoegenApi.Session.authenticate(args, Repo),
      {:ok, jwt, _ } <- Guardian.encode_and_sign(user, :access) do
      {:ok, %{token: jwt}}
    end
  end

  defp find_user(id) do
    case Repo.get(User, id) do
      nil -> {:error, "Not Found"}
      user -> {:ok, user}
    end
  end

  defp register_changeset(args) do
    %User{} |> User.registration_changeset(args)
  end

  defp format_errors(errors) do
    Enum.map(errors, fn({key, {message, _}}) -> "#{key} #{message}" end)
  end
end
