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

  @doc ~S"""
  Parse roman number to arabic

  ## Examples
    iex> ROMAN.parse("")
    0
    iex> ROMAN.parse("I")
    1
    iex> ROMAN.parse("II")
    2
    iex> ROMAN.parse("III")
    3
    iex> ROMAN.parse("IV")
    4
    iex> ROMAN.parse("V")
    5
    iex> ROMAN.parse("VI")
    6
    iex> ROMAN.parse("IX")
    9
    iex> ROMAN.parse("X")
    10
    iex> ROMAN.parse("XXVIII")
    28
  """
  def parse(number), do: parse(number,0)
  defp parse(number,accumulator), do: parse(number,accumulator,Enum.reverse(@numerals))
  defp parse(_,accumulator,[]), do: accumulator
  defp parse(number,accumulator,[{_,roman}|tail])
    when byte_size(number) < byte_size(roman),
    do: parse(number,accumulator, tail)
  defp parse(number,accumulator,[{arabic,roman}|tail]) do
    cond do
      String.slice(number, String.length(number) - String.length(roman), String.length(roman)) == roman -> parse(String.slice(number, 0, String.length(number)-String.length(roman)),accumulator+arabic)
      true -> parse(number,accumulator,tail)
    end
  end
#  defp parse(number,accumulator,[_|tail]), do: parse(number,accumulator,tail)
end
