defmodule Rockelivery.Factory do
  use ExMachina.Ecto, repo: Rockelivery.Repo

  alias Rockelivery.Item
  alias Rockelivery.User

  def user_params_factory do
    %{
      "name" => "Joe Doe",
      "email" => "joe.doe@mail.com",
      "age" => 19,
      "address" => "valid address",
      "cep" => "12345678",
      "cpf" => "12345678900",
      "password" => "valid_password"
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

  def item_params_factory do
    %{
      category: :drink,
      description: "Coca-Cola 600mL",
      price: Decimal.new("8.50"),
      photo: "https://products_img/coca-cola-600"
    }
  end

  def item_factory do
    %Item{
      category: :drink,
      description: "Coca-Cola 600mL",
      price: Decimal.new("8.50"),
      photo: "https://products_img/coca-cola-600",
      id: "6e27d5e9-2856-48e2-b50f-ce8a7a73f0c1"
    }
  end

  def cep_info_factory do
    %{
      "bairro" => "Sé",
      "cep" => "01001-000",
      "complemento" => "lado ímpar",
      "ddd" => "11",
      "gia" => "1004",
      "ibge" => "3550308",
      "localidade" => "São Paulo",
      "logradouro" => "Praça da Sé",
      "siafi" => "7107",
      "uf" => "SP"
    }
  end
end
