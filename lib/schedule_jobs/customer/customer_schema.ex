defmodule ScheduleJobs.Customer.CustomerSchema do
  use Ecto.Schema
  import Ecto.Changeset

  schema "customers" do
    field :age, :integer
    field :last_name, :string
    field :name, :string
  end

  @doc false
  def changeset(customer_schema, attrs) do
    customer_schema
    |> cast(attrs, [:name, :last_name, :age])
    |> validate_required([:name, :last_name, :age])
  end
end
