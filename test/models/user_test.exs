defmodule NoegenApi.UserTest do
  use NoegenApi.ModelCase

  alias NoegenApi.User

  @valid_changeset_attrs %{email: "some email", username: "some name"}
  @valid_registration_attrs %{
    email: "some email",
    username: "some name",
    password: "somepassword"
  }
  @invalid_attrs %{}

  test "changeset with valid attributes" do
    changeset = User.changeset(%User{}, @valid_changeset_attrs)
    assert changeset.valid?
  end

  test "changeset with invalid attributes" do
    changeset = User.changeset(%User{}, @invalid_attrs)
    refute changeset.valid?
  end
end
