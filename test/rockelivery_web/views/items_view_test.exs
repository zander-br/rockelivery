defmodule RockeliveryWeb.ItemsViewTest do
  use RockeliveryWeb.ConnCase, async: true

  import Phoenix.View
  import Rockelivery.Factory

  alias Rockelivery.Item
  alias RockeliveryWeb.ItemsView

  test "renders create.json" do
    item = build(:item)

    response = render(ItemsView, "create.json", item: item)

    item = %Item{
      category: :drink,
      description: "Coca-Cola 600mL",
      price: Decimal.new("8.50"),
      photo: "https://products_img/coca-cola-600",
      id: "6e27d5e9-2856-48e2-b50f-ce8a7a73f0c1"
    }

    assert %{item: item, message: "Item created!"} == response
  end
end
