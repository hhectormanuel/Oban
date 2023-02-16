defmodule ScheduleJobs.CustomerFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `ScheduleJobs.Customer` context.
  """

  @doc """
  Generate a customer_schema.
  """
  def customer_schema_fixture(attrs \\ %{}) do
    {:ok, customer_schema} =
      attrs
      |> Enum.into(%{
        age: 42,
        last_name: "some last_name",
        name: "some name"
      })
      |> ScheduleJobs.Customer.create_customer_schema()

    customer_schema
  end
end
