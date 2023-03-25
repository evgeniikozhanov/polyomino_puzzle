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
end
