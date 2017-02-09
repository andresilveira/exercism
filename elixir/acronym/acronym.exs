defmodule Acronym do
  @doc """
  Generate an acronym from a string.
  "This is a string" => "TIAS"
  """
  @spec abbreviate(String.t()) :: String.t()
  def abbreviate(string) do
    string
    |> String.split([" ", "-"])
    |> Enum.reduce("", fn(<<first>> <> rest, acronym)
      -> acronym
          <> String.upcase(<<first>>)
          <> Enum.join(List.flatten(Regex.scan(~r{[A-Z]}, rest)))
    end)
  end
end
