defmodule PolyominoPuzzle do
  @moduledoc """
  Provide methods for creating and handling polyomino puzzle game
  """

  @doc """
  Get hardcoded figures that we use in this game
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

  @doc """
     Divides figures into two heaps: known heap (that are placed on
     the game field) and user heap (that a player has to place on
     the game field in the game process).
     The `n` argument indicates size of the known heap.

   Examples

      iex> figures = PolyominoPuzzle.create_figures()
      iex> {known_figs, player_figs} = PolyominoPuzzle.get_n_random_figures(figures, 3)
      iex> length(known_figs)
      3
  """
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

  @doc """
    Determine whether figures contains a given figure

  ## Examples
    iex> PolyominoPuzzle.contains?([[1, 2], [1, 3]], [1, 2])
    true
  """
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
