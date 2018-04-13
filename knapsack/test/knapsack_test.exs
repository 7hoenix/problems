defmodule KnapsackTest do
  use ExUnit.Case
  doctest Knapsack

  @weapon %Item{name: "weapon", value: 10, weight: 5}
  @clothing %Item{name: "clothing", value: 5, weight: 2}
  @meal %Item{name: "meal", value: 1, weight: 1}
  @gold %Item{name: "gold", value: 100, weight: 3}

  @items Enum.shuffle([@weapon, @clothing, @meal, @gold])

  test "greedily chooses the most valuable product for weight" do
    items = Enum.shuffle([@clothing, @weapon])
    max_weight = 10
    knapsack = Knapsack.optimal_configuration(max_weight, items)

    assert %{"clothing" => 5} = knapsack.items
  end

  test "knows the relative weights for the smallest unit" do
    items = [@weapon, @meal]
    max_weight = 10
    knapsack = Knapsack.optimal_configuration(max_weight, items)

    assert %{"weapon" => 2} = knapsack.items
  end

  test "grabs in order until full" do
    max_weight = 10
    knapsack = Knapsack.optimal_configuration(max_weight, @items)

    assert %{"gold" => 3, "meal" => 1} = knapsack.items
  end
end
