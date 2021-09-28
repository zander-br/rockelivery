defmodule Rockelivery.Users.UpdateTest do
  use Rockelivery.DataCase, async: true

  import Rockelivery.Factory

  alias Rockelivery.{Error, User}
  alias Rockelivery.Users.Update

  describe "call/1" do
    test "when there is a user with the given id, returns the user" do
      uuid = "f62732cd-7b02-4594-8e64-d172299381a1"
      insert(:user)

      params = %{"id" => uuid, "age" => 21}

      response = Update.call(params)

      assert {:ok, %User{id: _id, name: "Joe Doe", email: "joe.doe@mail.com", age: 21}} = response
    end

    test "when there is invalid params, return an error" do
      uuid = "f62732cd-7b02-4594-8e64-d172299381a1"
      insert(:user)

      invalid_params = %{"id" => uuid, "age" => 17}

      response = Update.call(invalid_params)

      expected_response = %{
        age: ["must be greater than or equal to 18"]
      }

      assert {:error, %Error{status: :bad_request, result: changeset}} = response
      assert errors_on(changeset) == expected_response
    end

    test "when there is no user with id, return an error" do
      another_uuid = "7356b866-2ac6-4373-b455-36dde62484be"
      insert(:user)

      params = %{"id" => another_uuid, "age" => 21}

      response = Update.call(params)

      assert {:error, %Error{status: :not_found, result: "User not found"}} = response
    end
  end
end
