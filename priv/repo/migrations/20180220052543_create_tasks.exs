defmodule Tracker.Repo.Migrations.CreateTasks do
  use Ecto.Migration

  def change do
    create table(:tasks) do
      add :title, :text, null: false
      add :description, :text, null: false
      add :time_taken, :integer, default: 0
      add :active, :boolean, default: false
      add :is_completed, :boolean, default: false, null: false
      add :assigned_to_id, references(:users, on_delete: :delete_all), null: false

      timestamps()
    end

    create index(:tasks, [:assigned_to_id])
  end
end
