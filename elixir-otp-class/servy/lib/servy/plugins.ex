defmodule Servy.Plugins do

  alias Servy.Conv

  def track(%Conv{status: 404, path: path} = conv ) do
    if Mix.env != :test do
     IO.puts "Warning #{path} is on the loose!"
    end
    conv
  end

  def (%Conv{} = conv), do: conv

  def rewrite_path(%Conv{path: "/wildlife", } = conv) do
    %{ conv | path: "/wildthings" }
  end

  def rewrite_path(%Conv{} = conv), do: conv

  def log(%Conv{} = conv) do
    if Mix.env == :dev do
      IO.inspect conv
    end

    conv
  end
end
