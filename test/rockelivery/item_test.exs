defmodule Rockelivery.ItemTest do
  use Rockelivery.DataCase, async: true

  import Rockelivery.Factory

  alias Ecto.Changeset
  alias Rockelivery.Item

  describe "changeset/2" do
    test "when all params is valid, returns a valid changeset" do
      params = build(:item_params)

      response = Item.changeset(params)

      assert %Changeset{changes: %{description: "Coca-Cola 600mL"}, valid?: true} = response
    end

    test "when there is invalid price, returns an invalid changeset" do
      params = build(:item_params, price: Decimal.new("0"))

      response = Item.changeset(params)

      expected_response = %{price: ["must be greater than 0"]}

      assert errors_on(response) == expected_response
    end

    test "when there is invalid category, returns an invalid changeset" do
      params = build(:item_params, category: :invalid_category)

      response = Item.changeset(params)

      expected_response = %{category: ["is invalid"]}

      assert errors_on(response) == expected_response
    end
  end
end
