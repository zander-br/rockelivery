defmodule RockeliveryWeb.ItemsControllerTest do
  use RockeliveryWeb.ConnCase, async: true

  describe "create/2" do
    test "when all params is valid, creates the item", %{conn: conn} do
      params = %{
        "category" => "drink",
        "description" => "Água mineral com gás",
        "price" => 2.50,
        "photo" => "/priv/photos/agua_gas.png"
      }

      response =
        conn
        |> post(Routes.items_path(conn, :create, params))
        |> json_response(:created)

      assert %{
               "item" => %{
                 "category" => "drink",
                 "description" => "Água mineral com gás",
                 "price" => "2.5",
                 "photo" => "/priv/photos/agua_gas.png",
                 "id" => _id
               },
               "message" => "Item created!"
             } = response
    end

    test "when there is some error, returns the error", %{conn: conn} do
      params = %{
        "category" => "invalid_category",
        "description" => "Água mineral com gás",
        "price" => 0,
        "photo" => "/priv/photos/agua_gas.png"
      }

      response =
        conn
        |> post(Routes.items_path(conn, :create, params))
        |> json_response(:bad_request)

      expected_response = %{
        "message" => %{"category" => ["is invalid"], "price" => ["must be greater than 0"]}
      }

      assert response == expected_response
    end
  end
end
