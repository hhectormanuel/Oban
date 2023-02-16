defmodule ScheduleJobs.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  @impl true
  def start(_type, _args) do
    children = [
      # Start the Ecto repository
      ScheduleJobs.Repo,
      # Start the Telemetry supervisor
      ScheduleJobsWeb.Telemetry,
      # Start the PubSub system
      {Phoenix.PubSub, name: ScheduleJobs.PubSub},
      # Start the Endpoint (http/https)
      ScheduleJobsWeb.Endpoint,
      # Start a worker by calling: ScheduleJobs.Worker.start_link(arg)
      # {ScheduleJobs.Worker, arg}
      {Oban, Application.fetch_env!(:schedule_jobs, Oban)},

      ScheduleJobsWeb.PrintTime
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: ScheduleJobs.Supervisor]
    Supervisor.start_link(children, opts)
  end

  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  @impl true
  def config_change(changed, _new, removed) do
    ScheduleJobsWeb.Endpoint.config_change(changed, removed)
    :ok
  end
end
