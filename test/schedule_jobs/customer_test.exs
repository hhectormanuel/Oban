defmodule ScheduleJobs.CustomerTest do
  use ScheduleJobs.DataCase

  alias ScheduleJobs.Customer

  describe "customers" do
    alias ScheduleJobs.Customer.CustomerSchema

    import ScheduleJobs.CustomerFixtures

    @invalid_attrs %{age: nil, last_name: nil, name: nil}

    test "list_customers/0 returns all customers" do
      customer_schema = customer_schema_fixture()
      assert Customer.list_customers() == [customer_schema]
    end

    test "get_customer_schema!/1 returns the customer_schema with given id" do
      customer_schema = customer_schema_fixture()
      assert Customer.get_customer_schema!(customer_schema.id) == customer_schema
    end

    test "create_customer_schema/1 with valid data creates a customer_schema" do
      valid_attrs = %{age: 42, last_name: "some last_name", name: "some name"}

      assert {:ok, %CustomerSchema{} = customer_schema} = Customer.create_customer_schema(valid_attrs)
      assert customer_schema.age == 42
      assert customer_schema.last_name == "some last_name"
      assert customer_schema.name == "some name"
    end

    test "create_customer_schema/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Customer.create_customer_schema(@invalid_attrs)
    end

    test "update_customer_schema/2 with valid data updates the customer_schema" do
      customer_schema = customer_schema_fixture()
      update_attrs = %{age: 43, last_name: "some updated last_name", name: "some updated name"}

      assert {:ok, %CustomerSchema{} = customer_schema} = Customer.update_customer_schema(customer_schema, update_attrs)
      assert customer_schema.age == 43
      assert customer_schema.last_name == "some updated last_name"
      assert customer_schema.name == "some updated name"
    end

    test "update_customer_schema/2 with invalid data returns error changeset" do
      customer_schema = customer_schema_fixture()
      assert {:error, %Ecto.Changeset{}} = Customer.update_customer_schema(customer_schema, @invalid_attrs)
      assert customer_schema == Customer.get_customer_schema!(customer_schema.id)
    end

    test "delete_customer_schema/1 deletes the customer_schema" do
      customer_schema = customer_schema_fixture()
      assert {:ok, %CustomerSchema{}} = Customer.delete_customer_schema(customer_schema)
      assert_raise Ecto.NoResultsError, fn -> Customer.get_customer_schema!(customer_schema.id) end
    end

    test "change_customer_schema/1 returns a customer_schema changeset" do
      customer_schema = customer_schema_fixture()
      assert %Ecto.Changeset{} = Customer.change_customer_schema(customer_schema)
    end
  end
end
