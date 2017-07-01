defmodule NoegenApi.Schema.Types do
  use Absinthe.Schema.Notation
  use Absinthe.Ecto, repo: NoegenApi.Repo

  object :user do
    field :id, :id
    field :first_name, :string
    field :last_name, :string
    field :username, :string
    field :email, :string
    field :posts, list_of(:post), resolve: assoc(:posts)
  end

  object :post do
    field :id, :id
    field :title, :string
    field :body, :string
    field :user, :user, resolve: assoc(:user)
  end
end
