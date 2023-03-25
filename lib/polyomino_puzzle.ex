defmodule PolyominoPuzzle do
  @moduledoc """
  Documentation for PolyominoPuzzle.
  """

  @doc """
  Hello world.

  ## Examples

      iex> PolyominoPuzzle.hello()
      :world

  """
  def create_figures do
    [
        [[1, 'r'], [2, 'd'], [1, 'u'], [1, 'r']],
        [[1, 'r'], [1, 'd'], [1, 'r']],
        [[2, 'r'], [2, 'd']],
        [[1, 'r'], [1, 'd'], [2, 'r']],
        [[1, 'd'], [3, 'r']],
        [[2, 'r'], [1, 'd'], [1, 'l']],
        [[1, 'd'], [2, 'r']],
        [[2, 'r'], [1, 'l'], [1, 'd']],
        [[1, 'd'], [2, 'r'], [1, 'u']],
        [[1, 'r'], [1, 'd'], [1, 'r'], [1, 'd']],
        [[3, 'r'], [1, 'l'], [1, 'd']],
        [[1, 'r'], [1, 'd']]
    ]
  end

  def get_n_random_figures(n, figures) do
    {
      Enum.slice(shuffle_figures(figures), 0..n-1),
      Enum.slice(shuffle_figures(figures), n..-1)
    }
  end

  def shuffle_figures(figures) do
    Enum.shuffle(figures)
  end

  def contains?(figures, figure) do
    Enum.member?(figures, figure)
  end
end
