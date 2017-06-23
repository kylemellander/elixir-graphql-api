defmodule NoegenApi.Post do
  use NoegenApi.Web, :model

  schema "posts" do
    field :title, :string
    field :body, :string
    belongs_to :user, NoegenApi.User, foreign_key: :user_id

    timestamps()
  end

  @doc """
  Builds a changeset based on the `struct` and `params`.
  """
  def changeset(struct, params \\ %{}) do
    struct
    |> cast(params, [:title, :body])
    |> validate_required([:body])
  end
end
