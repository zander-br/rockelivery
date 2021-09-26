defmodule Rockelivery.Factory do
  use ExMachina

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
end
