defmodule ScheduleJobs.Repo.Migrations.CreateCustomers do
  use Ecto.Migration

  def change do
    create table(:customers) do
      add :name, :string
      add :last_name, :string
      add :age, :integer
    end
  end
end
