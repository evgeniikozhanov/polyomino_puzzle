defmodule PolyominoPuzzleTest do
  use ExUnit.Case
  doctest PolyominoPuzzle

  test "create_init_and_free_figure_sets" do
    {init_set, _free_set} = PolyominoPuzzle.create_init_and_free_figure_sets(3)
    assert length(init_set) == 3
  end

  test "shuffling a figure set" do
    figures = PolyominoPuzzle.create_figures()
    refute figures == PolyominoPuzzle.shuffle_figures(figures)
  end
end
