defmodule NoegenApi.Session do
  alias NoegenApi.User

  def authenticate(params, repo) do
    user = repo.get_by(User, email: String.downcase(params.email))
    case check_password(user, params.password) do
      true -> {:ok, user}
      _ -> {:error, "Invalid credentials"}
    end
  end

  defp check_password(user, password) do
    case user do
      nil -> false
      _ -> Comeonin.Bcrypt.checkpw(password, user.password_hash)
    end
  end
end
