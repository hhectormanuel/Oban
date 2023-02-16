defmodule ScheduleJobsWeb.LazyBusiness do
  use Oban.Worker,
    queue: :events,
    priority: 3,
    max_attempts: 3,
    tags: ["business"],
    unique: [period: 30]

  @impl Oban.Worker
  def perform(_job) do
    # do business slowly

    :ok
  end
end
