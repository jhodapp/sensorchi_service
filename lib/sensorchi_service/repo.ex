defmodule SensorchiService.Repo do
  use Ecto.Repo,
    otp_app: :sensorchi_service,
    adapter: Ecto.Adapters.Postgres
end
