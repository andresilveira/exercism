defmodule NucleotideCount do
  @nucleotides [?A, ?C, ?G, ?T]

  @doc """
  Counts individual nucleotides in a NucleotideCount strand.

  ## Examples

  iex> NucleotideCount.count('AATAA', ?A)
  4

  iex> NucleotideCount.count('AATAA', ?T)
  1
  """
  @spec count([char], char) :: non_neg_integer
  def count(strand, nucleotide) do
    strand
    |> Enum.map(fn(n) -> if n == nucleotide, do: 1, else: 0 end)
    |> Enum.sum
  end

  @doc """
  Returns a summary of counts by nucleotide.

  ## Examples

  iex> NucleotideCount.histogram('AATAA')
  %{?A => 4, ?T => 1, ?C => 0, ?G => 0}
  """
  @spec histogram([char]) :: map
  def histogram(strand) do
    empty_histogram = %{?A => 0, ?T => 0, ?C => 0, ?G => 0}
    increment = fn(n, histogram) -> Map.update!(histogram, n, &(&1 + 1)) end

    Enum.reduce(strand, empty_histogram, increment)
  end
end
