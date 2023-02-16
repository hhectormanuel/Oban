defmodule ScheduleJobsWeb.PageController do
  use ScheduleJobsWeb, :controller

  def index(conn, _params) do
    render(conn, "index.html")
  end
end
