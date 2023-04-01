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

  def get_n_random_figures(figures, n) do
    {
      Enum.slice(shuffle_figures(figures), 0..n-1),
      Enum.slice(shuffle_figures(figures), n..-1)
    }
  end

  def shuffle_figures(figures) do
    Enum.shuffle(figures)
  end

  def create_init_and_free_figure_sets(init_set_size) do
    PolyominoPuzzle.create_figures
    |> PolyominoPuzzle.shuffle_figures
    |> PolyominoPuzzle.get_n_random_figures(init_set_size)
  end

  def contains?(figures, figure) do
    Enum.member?(figures, figure)
  end

  def save(figures, filename) do
    binary = :erlang.term_to_binary(figures)
    File.write(filename, binary)
  end

  def load(filename) do
    case File.read(filename) do
      {:ok, binary} -> :erlang.binary_to_term(binary)
      {:error, _reason} -> "That file does not exist"
    end
  end
end
