defmodule NoegenApi.Schema do
  use Absinthe.Schema
  import_types NoegenApi.Schema.Types
  alias NoegenApi.UserResolver

  query do
    field :posts, list_of(:post) do
      resolve &NoegenApi.PostResolver.all/2
    end

    # field :users, list_of(:user) do
    #   resolve &UserResolver.all/2
    # end

    field :current_user, type: :user do
      resolve &UserResolver.current/2
    end
  end

  mutation do
    field :create_user, type: :user do
      arg :email, non_null(:string)
      arg :username, non_null(:string)
      arg :password, non_null(:string)

      resolve &UserResolver.create/2
    end

    field :login, type: :session do
      arg :email, non_null(:string)
      arg :password, non_null(:string)

      resolve &UserResolver.login/2
    end
  end
end
