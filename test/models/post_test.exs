defmodule NoegenApi.PostTest do
  use NoegenApi.ModelCase

  alias NoegenApi.Post

  @valid_attrs %{body: "some body", title: "some title"}
  @invalid_attrs %{}

  test "changeset with valid attributes" do
    changeset = Post.changeset(%Post{}, @valid_attrs)
    assert changeset.valid?
  end

  test "changeset with invalid attributes" do
    changeset = Post.changeset(%Post{}, @invalid_attrs)
    refute changeset.valid?
  end
end
