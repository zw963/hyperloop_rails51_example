class MeeterGreeter < Hyperloop::Component
  render(DIV) do
    H1 { 'hello world' }
    # 这里的 SayHello 用法, 就像调用其他的组件.
    # 需要提及的一点是: 这里的 SayHello 和普通的 Html 标签用法是一样的.
    # 可以理解为: 一个是原生标签(全部大写), 一个是自定义标签(驼峰式)
    # 由此看到了, 除了常规的 `标签 { ...}', 另一种用法是: `标签(...)'
    SayHelloTo(name: 'John')
    SayHelloTo(name: 'sally')
  end
end
