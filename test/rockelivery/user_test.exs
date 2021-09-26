defmodule Rockelivery.UserTest do
  use Rockelivery.DataCase, async: true

  alias Ecto.Changeset
  alias Rockelivery.User

  describe "changeset/2" do
    test "when all params are valid, returns a valid changeset" do
      params = %{
        name: "Joe Doe",
        email: "joe.doe@mail.com",
        age: 19,
        address: "valid address",
        cep: "12345678",
        cpf: "12345678900",
        password: "valid_password"
      }

      response = User.changeset(params)

      assert %Changeset{changes: %{name: "Joe Doe"}, valid?: true} = response
    end

    test "when updating a changeset, returns a valid changeset with the given changes" do
      params = %{
        name: "Joe Doe",
        email: "joe.doe@mail.com",
        age: 19,
        address: "valid address",
        cep: "12345678",
        cpf: "12345678900",
        password: "valid_password"
      }

      update_params = %{age: 20}

      response =
        params
        |> User.changeset()
        |> User.changeset(update_params)

      assert %Changeset{changes: %{age: 20}, valid?: true} = response
    end

    test "when there are some error, returns an invalid changeset" do
      params = %{
        name: "Joe Doe",
        email: "joe.doe@mail.com",
        age: 15,
        address: "valid address",
        cep: "12345678",
        cpf: "12345678900",
        password: "123"
      }

      response = User.changeset(params)

      expected_response = %{
        age: ["must be greater than or equal to 18"],
        password: ["should be at least 6 character(s)"]
      }

      assert errors_on(response) == expected_response
    end
  end
end
