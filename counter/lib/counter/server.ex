defmodule Counter.Server do
  def run(count) do
    new_count = listen(count)
    run(new_count)
  end

  def listen(count) do
    receive do
      {:tick, _pid} ->
        Counter.Core.inc(count)
      {:state, pid} ->
        IO.puts "listen count #{inspect count}"
        send(pid, {:count, count})
    end
  end
end