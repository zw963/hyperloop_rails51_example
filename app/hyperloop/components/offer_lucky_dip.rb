# 我们使用 store 来抽取 state 到一个单独的 Store.
# 这有利于从 Component 单独抽取 `状态和业务逻辑` 出来.

class Discounter < Hyperloop::Store
  # 这个 Discounter 即包含状态, 例如: state
  # 这里的 scope: :class, reader: true, 表示创建一个 reader 类方法.
  state discount: 30, scope: :class, reader: true
  state tries: 0, scope: :class, reader: true

  # 也包含修改状态的业务逻辑, 例如: luck_dip!
  def self.lucky_dip!
    mutate.discount(state.discount + rand(-5..5))
    mutate.tries(state.tries + 1)
  end

  # 为这个 State 创建一个 Operation, Operation 可以表示一系列有顺序被执行的 step
  # 将 Operation 类在他们操作的 State 类中定义, 是一个不错的最佳实践.
  class LuckyDipOp < Hyperloop::Operation
    # check_tries 相当于对 tries 参数添加了一个验证.
    def check_tries
      puts Discounter.tries
      # 这里通过调用 abort! 来宣告这个 step 失败.
      # abort! 是 Hyperloop::Operation 实现的一个实例方法.
      abort! if Discounter.tries > 2
    end
    # step 确保前一个执行成功后(验证成功), 下一个 step (修改状态的操作) 才被执行.
    step { check_tries }
    step { Discounter.lucky_dip! }
  end
end

class OfferLuckyDip < Hyperloop::Component
  render(DIV) do
    # State 中的 state 方法自动定义了一个 reader 类方法.
    H1 { "Your discount is #{Discounter.discount}%" }
    BUTTON { 'Lucky Dip' }.on(:click) do
      # 之前这里直接调用类方法.
      # 现在则传递一个 Operation 进来.
      Discounter.LuckyDipOp
    end
  end
end

# class OfferLuckyDip < Hyperloop::Component
#   # 这里设定了一个属于这个 Component 的 state.
#   # 如果有其他 Component 依赖于这个状态自动刷新,
#   # 我们就不得不通过 params 在 Component 之间传递状态.
#   # 这是很不方便的.
#   state discount: 30

#   render(DIV) do
#     H1 {"Your discount is #{state.discount}%"}
#     BUTTON { "Lucky Dip" }.on(:click) do
#       mutate.discount(state.discount + rand(-5..5))
#     end
#   end
# end
