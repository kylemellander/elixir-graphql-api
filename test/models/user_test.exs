defmodule NoegenApi.UserTest do
  use NoegenApi.ModelCase

  alias NoegenApi.User

  @valid_attrs %{email: "some email", username: "some name"}
  @invalid_attrs %{}

  test "changeset with valid attributes" do
    changeset = User.changeset(%User{}, @valid_attrs)
    assert changeset.valid?
  end

  test "changeset with invalid attributes" do
    changeset = User.changeset(%User{}, @invalid_attrs)
    refute changeset.valid?
  end
end
