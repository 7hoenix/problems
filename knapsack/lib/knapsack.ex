defmodule Knapsack do
  defstruct current_weight: 0, items: %{}

  def optimal_configuration(max_weight, items) do
    sorted_items_with_weights =
      items
      |> Enum.map(&find_item_with_weight/1)
      |> Enum.sort_by(&item_weight/1)
      |> Enum.reverse()
      |> Enum.reduce(%Knapsack{}, fn item, acc ->
        take_max_number_of_item(item.item, acc, max_weight)
      end)
  end

  defp find_item_with_weight(item), do: %{item: item, weight: item.value / item.weight}
  defp item_weight(%{weight: weight}), do: weight

  defp take_max_number_of_item(
         %Item{weight: weight, name: name} = item,
         %Knapsack{current_weight: current_weight, items: items} = knapsack,
         max_weight
       )
       when current_weight + weight <= max_weight do
    updated_knapsack = %Knapsack{
      current_weight: current_weight + weight,
      items: Map.update(items, name, 1, fn count -> count + 1 end)
    }

    take_max_number_of_item(item, updated_knapsack, max_weight)
  end

  defp take_max_number_of_item(item, knapsack, max_weight), do: knapsack
end
