defmodule User do
  defstruct [:name, :age]

  def new(name, age) do
    %User{name: name, age: age}
  end
end
