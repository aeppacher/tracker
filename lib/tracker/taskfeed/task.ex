defmodule Tracker.Taskfeed.Task do
  use Ecto.Schema
  import Ecto.Changeset
  alias Tracker.Taskfeed.Task


  schema "tasks" do
    field :description, :string
    field :is_completed, :boolean, default: false
    field :time_taken, :integer
    field :title, :string
    field :active, :boolean, default: false
    belongs_to :assigned_to, Tracker.Accounts.User
    has_many :timeblocks, Tracker.Taskfeed.Timeblock

    timestamps()
  end

  @doc false
  def changeset(%Task{} = task, attrs) do
    task
    |> cast(attrs, [:title, :description, :active, :time_taken, :is_completed, :assigned_to_id])
    |> validate_required([:title, :description, :is_completed, :assigned_to_id])
  end
end
