defmodule HeadsUpWeb.Live.EffortLive do
  use HeadsUpWeb, :live_view

  def mount(_params, _session, socket) do
  end

  def render(assigns) do
    ~H"""
    <form>
      <label>Minutes Per Responder:</label>
      <input type="number" name="minutes" value={} />
    </form>
    """
  end
end
