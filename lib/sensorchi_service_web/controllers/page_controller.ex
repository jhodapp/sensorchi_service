defmodule SensorchiServiceWeb.PageController do
  use SensorchiServiceWeb, :controller

  import Ecto.Query
  alias SensorchiService.Repo

  def index(conn, _params) do
    render(conn, "index.html")
  end

  def show_stats(conn, _params) do
    stats = %{temp: get_last_temp(),
              humidity: get_last_humidity(),
              pressure: get_last_pressure(),
              dust_concentration: get_last_dust_concentration(),
              air_purity: get_last_air_purity(),
              inserted_at: get_last_inserted_at()
    }
    render(conn, "stats.html", stats: stats)
  end

  def sensors_push_json(conn, %{"temp" => temp,
                                "humidity" => humidity,
                                "pressure" => pressure,
                                "dust_concentration" => dust_concentration,
                                "air_purity" => air_purity}) do
    Repo.insert(%SensorchiService.Sensor{ temperature: temp,
                                          humidity: humidity,
                                          pressure: pressure,
                                          dust_concentration: dust_concentration,
                                          air_purity: air_purity
                                        })
    status = %{code: "ok", desc: "Inserted successfully into DB"}
    render(conn, "response.json", status: status)
  end

  defp get_last_temp() do
    get_last_row().temperature
  end

  defp get_last_humidity() do
    get_last_row().humidity
  end

  defp get_last_pressure() do
    get_last_row().pressure
  end

  defp get_last_dust_concentration() do
    get_last_row().dust_concentration
  end

  defp get_last_air_purity() do
    get_last_row().air_purity
  end

  defp get_last_inserted_at() do
    get_last_row().inserted_at
  end

  defp get_last_row() do
    Repo.one(from s in SensorchiService.Sensor, order_by: [desc: s.id], limit: 1)
  end
end
