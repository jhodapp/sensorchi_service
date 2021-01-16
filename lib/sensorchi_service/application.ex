defmodule SensorchiService.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  def start(_type, _args) do
    children = [
      # Start the Ecto repository
      SensorchiService.Repo,
      # Start the Telemetry supervisor
      SensorchiServiceWeb.Telemetry,
      # Start the PubSub system
      {Phoenix.PubSub, name: SensorchiService.PubSub},
      # Start the Endpoint (http/https)
      SensorchiServiceWeb.Endpoint
      # Start a worker by calling: SensorchiService.Worker.start_link(arg)
      # {SensorchiService.Worker, arg}
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: SensorchiService.Supervisor]
    Supervisor.start_link(children, opts)
  end

  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  def config_change(changed, _new, removed) do
    SensorchiServiceWeb.Endpoint.config_change(changed, removed)
    :ok
  end
end
