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
    count(strand, nucleotide, 0)
  end

  def count([nucleotide|tail], nucleotide, acumulator) do
    count(tail, nucleotide, acumulator + 1)
  end

  def count([_|tail], nucleotide, acumulator) do
    count(tail, nucleotide, acumulator)
  end

  def count([], _, acumulator) do
    acumulator
  end

  @doc """
  Returns a summary of counts by nucleotide.

  ## Examples

  iex> NucleotideCount.histogram('AATAA')
  %{?A => 4, ?T => 1, ?C => 0, ?G => 0}
  """
  @spec histogram([char]) :: map
  def histogram(strand) do
    initial_histogram = %{?A => 0, ?T => 0, ?C => 0, ?G => 0}
    histogram(strand, initial_histogram)
  end

  def histogram([head|tail], acumulator) do
    histogram(tail, %{acumulator| head => acumulator[head] + 1})
  end

  def histogram([], acumulator) do
    acumulator
  end
end
