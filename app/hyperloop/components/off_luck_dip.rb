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
