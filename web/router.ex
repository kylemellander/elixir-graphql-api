defmodule NoegenApi.Router do
  use NoegenApi.Web, :router

  pipeline :api do
    plug :accepts, ["json"]
  end

  pipeline :graphql do
    plug Guardian.Plug.VerifyHeader, realm: "Bearer"
    plug Guardian.Plug.LoadResource
    plug NoegenApi.Web.AuthenticateUser
  end

  scope "/api" do
    pipe_through :graphql

    forward "/", Absinthe.Plug,
      schema: NoegenApi.Schema
  end

  forward "/graphiql", Absinthe.Plug.GraphiQL,
    schema: NoegenApi.Schema
end
