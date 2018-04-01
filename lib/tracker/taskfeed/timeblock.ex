defmodule Tracker.Taskfeed.Timeblock do
  use Ecto.Schema
  import Ecto.Changeset
  alias Tracker.Taskfeed.Timeblock


  schema "timeblocks" do
    field :time, :naive_datetime
    belongs_to :task, Tracker.Taskfeed.Task

    timestamps()
  end

  @doc false
  def changeset(%Timeblock{} = timeblock, attrs) do
    timeblock
    |> cast(attrs, [:time, :task_id])
    |> validate_required([:time, :task_id])
  end
end
