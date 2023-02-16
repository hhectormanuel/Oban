defmodule ScheduleJobs.Repo do
  use Ecto.Repo,
    otp_app: :schedule_jobs,
    adapter: Ecto.Adapters.Postgres
end
