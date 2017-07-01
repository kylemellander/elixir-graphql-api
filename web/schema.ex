defmodule NoegenApi.Schema do
  use Absinthe.Schema
  import_types NoegenApi.Schema.Types

  query do
    field :posts, list_of(:post) do
      resolve &NoegenApi.PostResolver.all/2
    end

    field :users, list_of(:user) do
      resolve &NoegenApi.UserResolver.all/2
    end
  end
end
