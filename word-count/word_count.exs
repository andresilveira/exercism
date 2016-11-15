defmodule Words do
  @invalid_characters ~r/[^\w-]/u
  @words_separator    ~r/[\s_]/
  
  @doc """
  Count the number of words in the sentence.

  Words are compared case-insensitively.
  """
  @spec count(String.t) :: map
  def count(sentence) do
    words = split_into_words(sentence)
    count(words, %{})
  end
  
  def count([first_word|rest], dictionary) do
    wrod = normalize_word(first_word)
    case empty?(wrod) do
      true  -> count(rest, dictionary) # the word is empty, move along
      false -> count(rest, update_dictionary(wrod, dictionary))
    end
  end

  def count([], dictionary) do
    dictionary
  end
  
  def split_into_words(sentence) do
    String.split(sentence, @words_separator)
  end

  def normalize_word(word) do
    String.replace(
      String.downcase(word),
    @invalid_characters, "")
  end

  def empty?(word) do
    "" == String.trim(word)
  end

  def update_dictionary(safe_word, dictionary) do
    Map.update(
      dictionary, # the collection
      safe_word,  # the key
      1,          # initial value if the key is not found
      &(&1 + 1)   # update function shorthand - receives one parameter (the value indexed by the key)
    )
  end
end
