defmodule NoegenApi.Router do
  use NoegenApi.Web, :router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_flash
    plug :protect_from_forgery
    plug :put_secure_browser_headers
  end

  pipeline :api do
    plug :accepts, ["json"]
  end

  pipeline :graphql do
    plug Guardian.Plug.VerifyHeader, realm: "Bearer"
    plug Guardian.Plug.LoadResource
    plug NoegenApi.Web.AuthenticateUser
  end

  scope "/", NoegenApi do
    pipe_through :browser # Use the default browser stack

    get "/", PageController, :index
  end

  scope "/api" do
    pipe_through :graphql

    forward "/", Absinthe.Plug,
      schema: NoegenApi.Schema
  end

  forward "/graphiql", Absinthe.Plug.GraphiQL,
    schema: NoegenApi.Schema
end
