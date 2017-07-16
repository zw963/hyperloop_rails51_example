# 我们使用 store 来抽取 state 到一个单独的 Store.
# 这有利于从 Component 单独抽取 `状态和业务逻辑` 出来.

class Discounter < Hyperloop::Store
  # 这个 Discounter 即包含状态, 例如: state
  # 这里的 scope: :class, 表示是一个类方法?
  state discount: 30, scope: :class, reader: true

  # 也包含修改状态的业务逻辑, 例如: luck_dip!
  def self.lucky_dip!
    mutate.discount(state.discount + rand(-5..5))
  end
end

class OfferLuckyDip < Hyperloop::Component
  render(DIV) do
    # State 中的 state 方法自动定义了一个 reader 类方法.
    H1 { "Your discount is #{Discounter.discount}%" }
    BUTTON { 'Lucky Dip' }.on(:click) do
      # 这里直接调用类方法.
      Discounter.lucky_dip!
    end
  end
end

class OfferLuckyDip < Hyperloop::Component
  # 这里设定了一个属于这个 Component 的 state.
  # 如果有其他 Component 依赖于这个状态自动刷新,
  # 我们就不得不通过 params 在 Component 之间传递状态.
  # 这是很不方便的.
  state discount: 30

  render(DIV) do
    H1 {"Your discount is #{state.discount}%"}
    BUTTON { "Lucky Dip" }.on(:click) do
      mutate.discount(state.discount + rand(-5..5))
    end
  end
end
