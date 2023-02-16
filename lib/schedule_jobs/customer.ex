defmodule ScheduleJobs.Customer do
  @moduledoc """
  The Customer context.
  """

  import Ecto.Query, warn: false
  alias ScheduleJobs.Repo

  alias ScheduleJobs.Customer.CustomerSchema


  def list_customer_by_id(id) do
    from(c in CustomerSchema,
      where: c.id == ^id
    )
    |> Repo.all()
  end

  @doc """
  Returns the list of customers.

  ## Examples

      iex> list_customers()
      [%CustomerSchema{}, ...]

  """
  def list_customers do
    Repo.all(CustomerSchema)
  end

  @doc """
  Gets a single customer_schema.

  Raises `Ecto.NoResultsError` if the Customer schema does not exist.

  ## Examples

      iex> get_customer_schema!(123)
      %CustomerSchema{}

      iex> get_customer_schema!(456)
      ** (Ecto.NoResultsError)

  """
  def get_customer_schema!(id), do: Repo.get!(CustomerSchema, id)

  @doc """
  Creates a customer_schema.

  ## Examples

      iex> create_customer_schema(%{field: value})
      {:ok, %CustomerSchema{}}

      iex> create_customer_schema(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_customer_schema(attrs \\ %{}) do
    %CustomerSchema{}
    |> CustomerSchema.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a customer_schema.

  ## Examples

      iex> update_customer_schema(customer_schema, %{field: new_value})
      {:ok, %CustomerSchema{}}

      iex> update_customer_schema(customer_schema, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_customer_schema(%CustomerSchema{} = customer_schema, attrs) do
    customer_schema
    |> CustomerSchema.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a customer_schema.

  ## Examples

      iex> delete_customer_schema(customer_schema)
      {:ok, %CustomerSchema{}}

      iex> delete_customer_schema(customer_schema)
      {:error, %Ecto.Changeset{}}

  """
  def delete_customer_schema(%CustomerSchema{} = customer_schema) do
    Repo.delete(customer_schema)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking customer_schema changes.

  ## Examples

      iex> change_customer_schema(customer_schema)
      %Ecto.Changeset{data: %CustomerSchema{}}

  """
  def change_customer_schema(%CustomerSchema{} = customer_schema, attrs \\ %{}) do
    CustomerSchema.changeset(customer_schema, attrs)
  end
end
