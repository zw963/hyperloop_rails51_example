class SayHelloTo < Hyperloop::Component
  param :name, type: :string

  render(DIV) do
    H4 { "Hello #{params.name}!" }
  end
end
