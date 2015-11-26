defmodule Luhn do
  def test(digits) do
    digits
      |> sanitize
      |> luhn_sum
      |> check
  end
  
  defp sanitize(digits) do
    digits
      |> to_char_list
      |> Enum.reverse
      |> string_to_numbers
  end
  defp string_to_numbers(digits) do
    Enum.map(digits, fn(digit) -> digit - ?0 end)
  end
  defp luhn_sum([odd, even | rest]) when even >= 5, do:
      odd + 2 * even - 10 + 1 + luhn_sum(rest)
  defp luhn_sum([odd, even | rest]), do:
      odd + 2 * even + luhn_sum(rest)
  defp luhn_sum([odd]), do: odd
  defp luhn_sum([]), do: 0
 
  defp check(sum) when rem(sum,10)==0, do: :valid
  defp check(_sum), do: :invalid
end
