defmodule HeadsUpWeb.IncidentLive.Show do
  use HeadsUpWeb, :live_view

  alias HeadsUp.Incidents
  import HeadsUpWeb.CustomComponents

  def mount(_params, _session, socket) do
    IO.inspect(self(), label: "MOUNT")
    {:ok, socket}
  end

  def handle_params(%{"id" => id}, _uri, socket) do
    IO.inspect(self(), label: "HANDLE PARAMS")
    incident = Incidents.get_incident(id)

    socket =
      socket
      |> assign(:incident, incident)
      |> assign(:page_title, incident.name)
      |> assign(:urgent_incidents, Incidents.urgent_incidents(incident))

    {:noreply, socket}
  end

  def render(assigns) do
    IO.inspect(self(), label: "RENDER")

    ~H"""
    <div class="incident-show">
      <div class="incident">
        <img src={@incident.image_path} />
        <section>
          <.badge status={@incident.status} />
          <header>
            <h2>Flat Tire</h2>
            <div class="priority">
              {@incident.priority}
            </div>
          </header>
          <div class="description">
            {@incident.description}
          </div>
        </section>
      </div>
      <div class="activity">
        <div class="left">
          <.back navigate={~p"/incidents"}>Back to list</.back>
        </div>
        <div class="right">
          <.urgent_incidents urgent_incidents={@urgent_incidents} />
        </div>
      </div>
    </div>
    """
  end

  def urgent_incidents(assigns) do
    ~H"""
    <section>
      <h4>Urgent Incidents</h4>
      <ul class="incidents">
        <li :for={incident <- @urgent_incidents}>
          <.link navigate={~p"/incidents/#{incident}"}>
            <img src={incident.image_path} /> {incident.name}
          </.link>
        </li>
      </ul>
    </section>
    """
  end
end
