defmodule Tracker.Taskfeed.Manage do
  use Ecto.Schema
  import Ecto.Changeset
  alias Tracker.Taskfeed.Manage


  schema "manages" do
    belongs_to :manager, Tracker.Accounts.User
    belongs_to :managee, Tracker.Accounts.User

    timestamps()
  end

  @doc false
  def changeset(%Manage{} = manage, attrs) do
    manage
    |> cast(attrs, [:manager_id, :managee_id])
    |> validate_required([:manager_id, :managee_id])
  end
end
