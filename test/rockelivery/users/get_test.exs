defmodule Rockelivery.Users.GetTest do
  use Rockelivery.DataCase, async: true

  import Rockelivery.Factory

  alias Rockelivery.{Error, User}
  alias Rockelivery.Users.Get

  describe "by_id/1" do
    test "when there is a user with the given id, returns the user" do
      uuid = "f62732cd-7b02-4594-8e64-d172299381a1"
      insert(:user)

      response = Get.by_id(uuid)

      assert {:ok, %User{id: _id, name: "Joe Doe", email: "joe.doe@mail.com", age: 19}} = response
    end

    test "when there is no user with id, return an error" do
      another_uuid = "7356b866-2ac6-4373-b455-36dde62484be"
      insert(:user)

      response = Get.by_id(another_uuid)

      assert {:error, %Error{status: :not_found, result: "User not found"}} = response
    end
  end
end
