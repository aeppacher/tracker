defmodule Tracker.Taskfeed.Task do
  use Ecto.Schema
  import Ecto.Changeset
  alias Tracker.Taskfeed.Task


  schema "tasks" do
    field :description, :string
    field :is_completed, :boolean, default: false
    field :time_taken, :integer
    field :title, :string
    belongs_to :assigned_to, Tracker.Accounts.User

    timestamps()
  end

  @doc false
  def changeset(%Task{} = task, attrs) do
    task
    |> cast(attrs, [:title, :description, :time_taken, :is_completed, :assigned_to_id])
    |> validate_required([:title, :description, :time_taken, :is_completed, :assigned_to_id])
  end
end
