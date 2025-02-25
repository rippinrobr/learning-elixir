defmodule HeadsUpWeb.CustomComponents do
  use HeadsUpWeb, :html

  attr :status, :atom, values: [:pending, :resolved, :canceled], required: true
  attr :class, :string, default: nil

  @spec badge(map()) :: Phoenix.LiveView.Rendered.t()
  def badge(assigns) do
    ~H"""
    <div class={[
      "rounded-md px-2 py-1 text-xs font-medium uppercase inline-block border",
      @status == :resolved && "text-lime-600 border-lime-600",
      @status == :pending && "text-amber-600 border-amber-600",
      @status == :cancel && "text-gray-600 border-gray-600",
      @class
    ]}>
      {@status}
    </div>
    """
  end

  slot :inner_block, required: true
  slot :tagline
  @spec headline(map()) :: Phoenix.LiveView.Rendered.t()
  def headline(assigns) do
    assigns = assign(assigns, :emoji, ~w(😇 😍 🥳) |> Enum.random())
    ~H"""
    <div class="headline">
      <h1>
        <%= render_slot(@inner_block) %>
      </h1>
      <div :for={line <- @tagline} class="tagline">
        <%= render_slot(line, @emoji) %>
      </div>
    </div>
    """
  end
end
