defmodule RunLengthEncoder do
  @doc """
  Generates a string where consecutive elements are represented as a data value and count.
  "AABBBCCCC" => "2A3B4C"
  For this example, assume all input are strings, that are all uppercase letters.
  It should also be able to reconstruct the data into its original form.
  "2A3B4C" => "AABBBCCCC"
  """
  @spec encode(String.t) :: String.t
  def encode(string) do
    string
    |> String.codepoints
    |> Enum.reduce([], fn
      (letter, [{letter, count} | tail]) ->  [{letter, count + 1} | tail]
      (new_letter, list) -> [{new_letter, 1} | list]
    end)
    |> Enum.reduce("", fn(pair, encoded) -> count_to_string(pair) <> encoded end)
  end

  defp count_to_string({letter, 1}), do: letter
  defp count_to_string({letter, count}), do: Integer.to_string(count) <> letter

  @spec decode(String.t) :: String.t
  def decode(string) do
    Regex.scan(~r{(\d*)([\w|\s])}, string)
    |> Enum.reduce("", fn
      ([_, "", letter], decoded) -> decoded <> String.duplicate(letter, 1)
      ([_, count, letter], decoded) -> decoded <> String.duplicate(letter, String.to_integer(count))
    end)
  end
end
