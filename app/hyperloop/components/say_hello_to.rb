class SayHelloTo < Hyperloop::Component
  # 下面的代码是可选的, 但是编译为 js 时会有更好的性能.
  param :name, type: String

  render(DIV) do
    H4 { "Hello #{params.name}!" }
  end
end
