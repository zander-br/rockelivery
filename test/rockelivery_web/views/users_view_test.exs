defmodule RockeliveryWeb.UsersViewTest do
  use RockeliveryWeb.ConnCase, async: true

  import Phoenix.View
  import Rockelivery.Factory

  alias Rockelivery.User
  alias RockeliveryWeb.UsersView

  test "renders create.json" do
    user = build(:user)

    response = render(UsersView, "create.json", user: user)

    assert %{
             message: "User created!",
             user: %User{
               address: "valid address",
               age: 19,
               cep: "12345678",
               cpf: "12345678900",
               email: "joe.doe@mail.com",
               id: "f62732cd-7b02-4594-8e64-d172299381a1",
               inserted_at: nil,
               name: "Joe Doe",
               password: "valid_password",
               password_hash: nil,
               updated_at: nil
             }
           } = response
  end
end
