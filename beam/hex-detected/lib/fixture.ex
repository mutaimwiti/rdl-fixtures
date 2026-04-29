# Placeholder Elixir source so linguist counts Elixir bytes for this fixture.
defmodule Rdl.Fixture do
  @greeting "hello from rdl-fixtures BEAM scenario"

  def greeting, do: @greeting

  def main do
    IO.puts(@greeting)
    @greeting
  end
end
