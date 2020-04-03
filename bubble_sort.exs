defmodule Bubble do
  # A simple implementation of Bubble Sort Algorithm.

  @spec sort([integer()]) :: [integer()]
  @doc """
  Sorts the list of integers using bubble sort algorithm.

  # Examples

  iex> Bubble.sort([14, 3, 113, 64, 3, 34, 25, 12, 109, 22, 11, 90, -1, -4])
  [-4, -1, 3, 3, 11, 12, 14, 22, 25, 34, 64, 90, 109, 113]
  """
  def sort(list) when is_list(list) do
    list
    |> do_pass(length(list) - 1)
  end

  @doc """
  Repeat pass till the time list is sorted.
  """
  def do_pass(list, 0), do: list

  def do_pass(list, pass) when pass > 0 do
    list
    |> do_iter(length(list) - 1)
    |> do_pass(pass - 1)
  end

  @doc """
  Iterates the entire list and bubbles the highest value to the end of the list.
  """
  def do_iter(list, 0), do: list
  def do_iter([x, y | t], count) when x > y, do: [y | do_iter([x | t], count - 1)]
  def do_iter([x, y | t], count) when x <= y, do: [x | do_iter([y | t], count - 1)]
end

Bubble.sort([14, 3, 113, 64, 3, 34, 25, 12, 109, 22, 11, 90, -1, -4]) |> IO.inspect()
