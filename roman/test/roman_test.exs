defmodule ROMANTest do
  use ExUnit.Case
  doctest ROMAN

  test "Convert->Parse tests", do: convertParseTests()

  def convertParseTests, do: convertParseTests(0)
  defp convertParseTests(testCase) when testCase < 30 do
    assert ROMAN.parse(ROMAN.converts(testCase)) == testCase
    convertParseTests(testCase+1)
  end
  defp convertParseTests(testCase), do: assert ROMAN.parse(ROMAN.converts(testCase)) == testCase
end
