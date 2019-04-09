defmodule ROMANTest do
  use ExUnit.Case
  doctest ROMAN

  test "greets the world" do
    assert ROMAN.hello() == :world
  end
end
