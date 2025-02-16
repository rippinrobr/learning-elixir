defmodule RaffleyWeb.EstimatorLive do
  use RaffleyWeb, :live_view

  # mount
  def mount(_params, _session, socket) do
    # send message when connected
    if connected?(socket) do
      # Process.send_after(self(), :tick, 2000)
    end

    socket = assign(socket, tickets: 0, price: 3)

    IO.inspect(self(), label: "mount")

    {:ok, socket}
  end

  # render
  def render(assigns) do
    IO.inspect(self(), label: "render")

    ~H"""
    <div class="estimator">
      <h1>Raffle Esitmator</h1>

      <section>
        <button phx-click="add" phx-value-quantity="5">+</button>
        <div>
          {@tickets}
        </div>
        @
        <div>
          ${@price}
        </div>
        =
        <div>${@tickets * @price}</div>
      </section>

      <form phx-submit="set-price">
        <label>Ticket Price</label>
        <input type="number" name="price" value={@price} />
      </form>
    </div>
    """
  end

  # handle_event
  def handle_event("add", %{"quantity" => quantity}, socket) do
    IO.inspect(self(), label: "event add")

    socket = update(socket, :tickets, &(&1 + String.to_integer(quantity)))

    {:noreply, socket}
  end

  def handle_event("set-price", %{"price" => price}, socket) do
    IO.inspect(self(), label: "event set-price")

    socket = assign(socket, :price, String.to_integer(price))
    IO.inspect(socket)
    {:noreply, socket}
  end

  def handle_info(:tick, socket) do
    # Process.send_after(self(), :tick, 2000)
    {:noreply, update(socket, :tickets, &(&1 + 10))}
  end
end
