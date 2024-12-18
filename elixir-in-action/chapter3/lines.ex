defmodule Lines do
  def large_lines!(path) do
    File.stream!(path)
    |> Stream.map(&String.trim_trailing(&1, "\n"))
    |> Enum.filter(&(String.length(&1) > 8))
  end

  def lines_length!(path) do
    File.stream!(path)
    |> Stream.map(&String.trim_trailing(&1, "\n"))
    |> Enum.map(&String.length(&1))
    # |> Enum.each(&(String.length(&1)))
  end
end
