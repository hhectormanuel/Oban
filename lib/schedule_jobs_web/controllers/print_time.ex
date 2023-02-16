defmodule ScheduleJobsWeb.PrintTime do
  use GenServer

  def start_link(_arg), do: GenServer.start_link(__MODULE__, [], name: __MODULE__)

  def second(), do: GenServer.call(__MODULE__, :second)
  def minute(), do: GenServer.call(__MODULE__, :minute)
  def hour(), do: GenServer.call(__MODULE__, :hour)
  def reset(), do: send(__MODULE__, :reset)
  def state(), do: GenServer.call(__MODULE__, :time)

  def init(_init_arg) do
    {:ok, 0}
  end

  def handle_info(:reset, _state) do
    {:noreply, 0}
  end

  def handle_call(:time, _from, state) do
    {:reply, state, state}
  end

  def handle_call(:second, _from, state) do
    {:reply, Time.utc_now().second, state + 1}
  end

  def handle_call(:minute, _from, state) do
    {:reply, Time.utc_now().minute, state + 1}
  end

  def handle_call(:hour, _from, state) do
    {:reply, Time.utc_now().hour, state + 1}
  end



end
