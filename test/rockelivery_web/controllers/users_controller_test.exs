defmodule RockeliveryWeb.UsersControllerTest do
  use RockeliveryWeb.ConnCase, async: true

  import Rockelivery.Factory

  describe "create/2" do
    test "when all params are valid, creates the user", %{conn: conn} do
      params = %{
        "name" => "Joe Doe",
        "email" => "joe.doe@mail.com",
        "age" => 19,
        "address" => "valid address",
        "cep" => "12345678",
        "cpf" => "12345678900",
        "password" => "valid_password"
      }

      response =
        conn
        |> post(Routes.users_path(conn, :create, params))
        |> json_response(:created)

      assert %{
               "message" => "User created!",
               "user" => %{
                 "address" => "valid address",
                 "age" => 19,
                 "cpf" => "12345678900",
                 "email" => "joe.doe@mail.com",
                 "id" => _id,
                 "name" => "Joe Doe"
               }
             } = response
    end

    test "when there is some error, returns the error", %{conn: conn} do
      params = %{
        "name" => "Joe Doe",
        "email" => "joe.doe@mail.com"
      }

      response =
        conn
        |> post(Routes.users_path(conn, :create, params))
        |> json_response(:bad_request)

      expected_reponse = %{
        "message" => %{
          "address" => ["can't be blank"],
          "age" => ["can't be blank"],
          "cep" => ["can't be blank"],
          "cpf" => ["can't be blank"]
        }
      }

      assert response == expected_reponse
    end
  end

  describe "delete/2" do
    test "when there is a user with the given id, deletes the user", %{conn: conn} do
      id = "f62732cd-7b02-4594-8e64-d172299381a1"
      insert(:user)

      response =
        conn
        |> delete(Routes.users_path(conn, :delete, id))
        |> response(:no_content)

      assert response == ""
    end

    test "when there is no user with id, return an error", %{conn: conn} do
      another_uuid = "7356b866-2ac6-4373-b455-36dde62484be"
      insert(:user)

      response =
        conn
        |> delete(Routes.users_path(conn, :delete, another_uuid))
        |> json_response(:not_found)

      expected_reponse = %{"message" => "User not found"}

      assert response == expected_reponse
    end
  end

  describe "show/2" do
    test "when there is a user with the given id, returnss the user", %{conn: conn} do
      id = "f62732cd-7b02-4594-8e64-d172299381a1"
      insert(:user)

      response =
        conn
        |> get(Routes.users_path(conn, :show, id))
        |> json_response(:ok)

      assert %{
               "user" => %{
                 "id" => _id,
                 "name" => "Joe Doe",
                 "email" => "joe.doe@mail.com",
                 "age" => 19,
                 "cpf" => "12345678900",
                 "address" => "valid address"
               }
             } = response
    end

    test "when there is no user with id, return an error", %{conn: conn} do
      another_uuid = "7356b866-2ac6-4373-b455-36dde62484be"
      insert(:user)

      response =
        conn
        |> get(Routes.users_path(conn, :show, another_uuid))
        |> json_response(:not_found)

      expected_reponse = %{"message" => "User not found"}

      assert response == expected_reponse
    end
  end
end
