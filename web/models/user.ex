defmodule NoegenApi.User do
  use NoegenApi.Web, :model

  schema "users" do
    field :first_name, :string
    field :last_name, :string
    field :email, :string
    field :username, :string
    field :password_hash, :string
    field :password, :string, virtual: true

    has_many :posts, NoegenApi.Post

    timestamps()
  end

  @doc """
  Builds a changeset based on the `struct` and `params`.
  """
  def changeset(struct, params \\ %{}) do
    @spec changeset(struct, params :: map \\ %{}) :: changeset

    struct
    |> cast(params, [:username, :email, :first_name, :last_name])
    |> validate_required([:username, :email])
    |> unique_constraint(:username)
    |> unique_constraint(:email)
  end

  def registration_changeset(struct, params) do
    @spec registration_changeset(struct, params :: map) :: changeset

    struct
    |> changeset(params)
    |> cast(params, [:password])
    |> validate_length(:password, min: 6, max: 100)
    |> add_password_hash()
  end

  defp add_password_hash(changeset) do
    case changeset do
      %Ecto.Changeset{valid?: true, changes: %{password: password}} ->
        put_change(
          changeset,
          :password_hash,
          Comeonin.Bcrypt.hashpwsalt(password)
        )
      _ ->
        changeset
    end
  end
end
