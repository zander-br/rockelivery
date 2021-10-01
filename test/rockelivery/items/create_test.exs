defmodule Rockelivery.Items.CreateTest do
  use Rockelivery.DataCase, async: true

  import Rockelivery.Factory

  alias Rockelivery.{Error, Item}
  alias Rockelivery.Items.Create

  describe "call/1" do
    test "when all params is valid, return the item" do
      params = build(:item_params)

      response = Create.call(params)

      assert {:ok,
              %Item{
                id: _id,
                category: :drink,
                description: "Coca-Cola 600mL"
              }} = response
    end

    test "when there is invalid params, return an error" do
      invalid_params =
        build(:item_params, %{price: Decimal.new("0"), category: :invalid_category})

      response = Create.call(invalid_params)

      expected_response = %{category: ["is invalid"], price: ["must be greater than 0"]}

      assert {:error, %Error{status: :bad_request, result: changeset}} = response
      assert errors_on(changeset) == expected_response
    end
  end
end
