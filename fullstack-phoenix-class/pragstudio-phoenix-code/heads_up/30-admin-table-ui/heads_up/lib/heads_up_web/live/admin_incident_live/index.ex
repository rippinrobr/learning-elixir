defmodule HeadsUpWeb.AdminIncidentLive.Index do
  use HeadsUpWeb, :live_view

  alias HeadsUp.Admin
  import HeadsUpWeb.CustomComponents

  def mount(_params, _session, socket) do
    socket =
      socket
      |> assign(:page_title, "Listing Incidents")
      |> stream(:incidents, Admin.list_incidents())

    {:ok, socket}
  end

  def render(assigns) do
    ~H"""
    <div class="admin-index">
      <.header>
        <%= @page_title %>
      </.header>
      <.table id="incidents" rows={@streams.incidents}>
        <:col :let={{_dom_id, incident}} label="Name">
          <.link navigate={~p"/incidents/#{incident}"}>
            <%= incident.name %>
          </.link>
        </:col>

        <:col :let={{_dom_id, incident}} label="Status">
          <.badge status={incident.status} />
        </:col>

        <:col :let={{_dom_id, incident}} label="Priority">
          <%= incident.priority %>
        </:col>
      </.table>
    </div>
    """
  end
end
