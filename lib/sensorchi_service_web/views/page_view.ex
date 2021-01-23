defmodule SensorchiServiceWeb.PageView do
  use SensorchiServiceWeb, :view

  def render("response.json", %{status: status}) do
    %{code: status.code, desc: status.desc}
  end
end
