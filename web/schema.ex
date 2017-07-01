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

    field :current_user, type: :user do
      resolve &NoegenApi.UserResolver.current/2
    end
  end

  mutation do
    field :user, type: :user do
      arg :email, non_null(:string)
      arg :username, non_null(:string)
      arg :password, non_null(:string)

      resolve &NoegenApi.UserResolver.create/2
    end
  end
end
