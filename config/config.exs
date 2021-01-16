# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.

# General application configuration
use Mix.Config

config :sensorchi_service,
  ecto_repos: [SensorchiService.Repo]

# Configures the endpoint
config :sensorchi_service, SensorchiServiceWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "XnyVEVgU36/LRemjmVM5NfI8cYD+1gIL5gxt0KCEvtPmqc6ZT8bjOXghPF5u63bd",
  render_errors: [view: SensorchiServiceWeb.ErrorView, accepts: ~w(html json), layout: false],
  pubsub_server: SensorchiService.PubSub,
  live_view: [signing_salt: "B8JNxEm6"]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env()}.exs"
