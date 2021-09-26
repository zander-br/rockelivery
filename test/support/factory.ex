defmodule Rockelivery.Factory do
  use ExMachina.Ecto, repo: Rockelivery.Repo

  alias Rockelivery.User

  def user_params_factory do
    %{
      name: "Joe Doe",
      email: "joe.doe@mail.com",
      age: 19,
      address: "valid address",
      cep: "12345678",
      cpf: "12345678900",
      password: "valid_password"
    }
  end

  def user_factory do
    %User{
      name: "Joe Doe",
      email: "joe.doe@mail.com",
      age: 19,
      address: "valid address",
      cep: "12345678",
      cpf: "12345678900",
      password: "valid_password",
      id: "f62732cd-7b02-4594-8e64-d172299381a1"
    }
  end
end
