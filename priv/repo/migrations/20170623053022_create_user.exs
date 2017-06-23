defmodule NoegenApi.Repo.Migrations.CreateUser do
  use Ecto.Migration

  def change do
    create table(:users) do
      add :username, :string, null: false
      add :first_name, :string
      add :last_name, :string
      add :email, :string
      add :password_hash, :string, null: false

      timestamps()
    end
    
    create unique_index(:users, [:username])
    create unique_index(:users, [:email])
  end
end
