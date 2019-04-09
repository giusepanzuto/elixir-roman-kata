defmodule ROMAN do
  @moduledoc """
  Documentation for ROMAN.
  """
  @numerals [{10, "X"}, {9, "IX"}, {5, "V"}, {4, "IV"}, {1, "I"}]

  @doc ~S"""
  Converts arabic to roman number

  ## Examples
    iex> ROMAN.converts(0)
    ""
    iex> ROMAN.converts(1)
    "I"
    iex> ROMAN.converts(2)
    "II"
    iex> ROMAN.converts(3)
    "III"
    iex> ROMAN.converts(4)
    "IV"
    iex> ROMAN.converts(5)
    "V"
    iex> ROMAN.converts(6)
    "VI"
    iex> ROMAN.converts(9)
    "IX"
    iex> ROMAN.converts(10)
    "X"
    iex> ROMAN.converts(28)
    "XXVIII"
  """
  def converts(number), do: converts(number, @numerals)
  defp converts(number, _) when number < 1, do: ""
  defp converts(number, [{arabic,roman}|_]) when number >= arabic, do: roman <> converts(number - arabic)
  defp converts(number, [_|tail]), do: converts(number, tail)

end
