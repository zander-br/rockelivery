defmodule RockeliveryWeb.UsersControllerTest do
  use RockeliveryWeb.ConnCase, async: true

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
  end
end
