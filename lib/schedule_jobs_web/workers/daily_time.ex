defmodule ScheduleJobsWeb.Workers.DailyTime do
  use Oban.Worker

  # alias ScheduleJobs.Customer
  # alias ScheduleJobs.Customer.CustomerSchema
  alias ScheduleJobsWeb.PrintTime



  @impl Oban.Worker
  def perform(%Oban.Job{args: %{"id" => id, every: minutes} = args}) do
    model = ScheduleJobs.Customer.get_customer_schema!(id)
    IO.puts(model)
    new(args, schedule_in: {minutes, :minutes})
    |> Oban.insert()

    :ok
  end

  @impl Oban.Worker
  def perform(_job) do
    IO.inspect(PrintTime.hour())
    :ok
  end
end
