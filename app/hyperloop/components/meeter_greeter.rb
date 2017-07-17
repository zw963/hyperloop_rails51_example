# 这个演示了如何在一个 Component 中调用其他的 Components

class MeeterGreeter < Hyperloop::Component
  render(DIV) do
    H1 { 'hello world' }
    # 这里的 SayHello 用法, 就像调用其他的组件.
    # 需要提及的一点是: 这里的 SayHello 和普通的 Html 标签用法是一样的.
    # 事实上, 所有原生 HTML 标签, 都被包装成了组件.
    # 只不过原生标签全部大写, 而自定义标签采用驼峰式.
    # 由此看到了, 除了常规的 `标签 { ...}', 另一种用法是: `标签(...)'

    # 根据文档:
    # Everything in the brackets is passed to the Component as parameters
    # and everything in the curly brace is rendered within the Component.
    # you can with both, but never just MyComponent()

    # 即:
    # 要么, 给一个组件传递数据, 来 render 它.(就像我们当前做的.)
    # 要么, 使用 block 来设定这个(原生)组件的 value.
    SayHelloTo(name: 'John')
    SayHelloTo(name: 'sally')
  end
end

class SayHelloTo < Hyperloop::Component
  # 下面的代码是可选的, 但是编译为 js 时会有更好的性能.
  param :name, type: String

  render(DIV) do
    H4 { "Hello #{params.name}!" }
  end
end
