defmodule ControlFlow do
  def ok!({:ok, data}) do
    data
  end

  def ok!({atom, _}) do
    raise RuntimeError, message: "Received #{atom}."
  end
end

IO.inspect ControlFlow.ok! File.open("control_flow_1.exs")
ControlFlow.ok! File.open("control_flx")
