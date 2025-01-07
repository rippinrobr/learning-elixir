defmodule RaffleyWeb.RuleController do
  use RaffleyWeb, :controller

  def index(conn, _params) do
    IO.puts("Here")
    render(conn, :index)
  end
end