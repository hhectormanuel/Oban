defmodule ScheduleJobsWeb.Workers.DailyTime do
  use Oban.Worker

  # alias ScheduleJobs.Customer
  # alias ScheduleJobs.Customer.CustomerSchema
  alias ScheduleJobsWeb.PrintTime

  @impl Oban.Worker
  def perform(_job) do
    IO.inspect(PrintTime.hour())
    :ok
  end

  @impl Oban.Worker
  def perform(%Oban.Job{args: %{"id" => id} = args}) do
    model = MyApp.Repo.get(MyApp.Business.Man, id)

    case args do
      %{"in_the" => "business"} ->
        IO.inspect(model)

      %{"vote_for" => vote} ->
        IO.inspect([vote, model])

      _ ->
        IO.inspect(model)
    end

    :ok
  end

end
