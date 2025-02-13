defmodule HeadsUpWeb.EffortLive do
  use HeadsUpWeb, :live_view

  def mount(_params, _session, socket) do
    {:ok, assign(socket, responders: 3, minutes: 10, avg_response_time: 0)}
  end

  def render(assigns) do
    ~H"""
    <div class="estimator">
      <h1>Raffle Esitmator</h1>

      <section>
        <button phx-click="add" phx-value-responders="3">+</button>
        <div>
          {@responders}
        </div>
        @
        <div>
          {@minutes}
        </div>
        =
        <div>{div(@minutes, @responders)} avg response time</div>
      </section>
    </div>

    <form phx-submit="recalculate">
      <label>Minutes Per Responder:</label>
      <input type="number" name="minutes" value={@minutes} />
    </form>
    """
  end

  def handle_event("add", %{"responders" => responders}, socket) do
    {:noreply, update(socket, :responders, &(&1 + String.to_integer(responders)))}
  end

  def handle_event("recalculate", %{"minutes" => minutes}, socket) do
    IO.puts("recalculate")
    IO.inspect(minutes)
    IO.inspect(socket)

    {:noreply,
     assign(
       socket,
       :avg_response_time,
       &div(&1, socket.assigns.responders)
     )}
  end
end
