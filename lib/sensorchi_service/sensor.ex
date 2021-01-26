defmodule SensorchiService.Sensor do
  use Ecto.Schema
  import Ecto.Changeset

  schema "sensors" do
    field :air_purity, :string
    field :dust_concentration, :float
    field :humidity, :float
    field :pressure, :integer
    field :temperature, :float

    timestamps()
  end

  @doc false
  def changeset(sensor, attrs) do
    sensor
    |> cast(attrs, [:temperature, :humidity, :dust_concentration, :pressure, :air_purity])
    |> validate_required([:temperature, :humidity, :dust_concentration, :pressure, :air_purity])
  end
end
