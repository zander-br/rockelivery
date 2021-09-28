defmodule Rockelivery.Users.DeleteTest do
  use Rockelivery.DataCase, async: true

  import Rockelivery.Factory

  alias Rockelivery.{Error, Repo, User}
  alias Rockelivery.Users.Delete

  describe "call/1" do
    test "when there is a user with the given id, deletes the user" do
      uuid = "f62732cd-7b02-4594-8e64-d172299381a1"
      insert(:user)

      response = Delete.call(uuid)

      user_database = Repo.get(User, uuid)

      assert {:ok, %User{email: "joe.doe@mail.com", name: "Joe Doe"}} = response

      assert user_database == nil
    end

    test "when there is no user with id, return an error" do
      another_uuid = "7356b866-2ac6-4373-b455-36dde62484be"
      insert(:user)

      response = Delete.call(another_uuid)

      assert {:error, %Error{status: :not_found, result: "User not found"}} = response
    end
  end
end
