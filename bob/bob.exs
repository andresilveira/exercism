defmodule Bob do
  @doc """
  Oh `Bob`, you're such a nice guy...
  """
  def hey(input) do
    cond do
      empty?(input) ->
        "Fine. Be that way!"
      question?(input) ->
        "Sure."
      shouting?(input) ->
        "Whoa, chill out!"
      true ->
        "Whatever."
    end
  end
  
  @doc """
  Checks if the `input` is empty.
  """
  def empty?(input) do
    "" == String.trim(input)
  end
  
  @doc """
  Checks if `input` is a question (aka ends with a question mark)
  """
  def question?(input) do
    String.ends_with?(input, "?")
  end
  
  @doc """
  Checks if `input` is some kind of shouting (that doesn't include only numbers)
  """
  def shouting?(input) do
    input == String.upcase(input) && !only_numbers?(input)
  end
  
  @doc """
  Checks if `input` is some kind of numbers list
  """
  def only_numbers?(input) do
    # replaces all digits followed by a special character with empty string
    # eg. 1 - 2 - 3, 1,2,3, 1*2*3, etc
    empty?(String.replace(input, ~r/\d+\W*/, ""))
  end
end
