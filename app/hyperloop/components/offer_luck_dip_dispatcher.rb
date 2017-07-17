# 这个例子是 offer_lucky_dip 的 dispatcher 版本的例子.
# 加的有些生硬, 但是应该可以证明核心的思路.

class LuckyDipOp1 < Hyperloop::Operation
  # 这里的写法是最大的不同!
  # 如果使用新的 dispatcher 模式, 在 Operation 中, 并不包含和 Store 进行交互的代码.
  # 因为可能同时有多个 Store 订阅了当前的 LuckyDipOp1

  # 下面的代码仅仅是 puts 一个日志, 如果这个 Operation 是个 Logout 操作, 就会变得很有意义.
  puts 'Do the real thinngs aboutLuckyDipOp operation.'
end

class Discounter1 < Hyperloop::Store
  state discount: 30, scope: :class, reader: true
  state tries: 0, scope: :class, reader: true

  # 这行代码让 Discounter1 订阅 LuckyDipOp1.
  # 当检测到 LuckyDipOp1.run 被调用时, 代码块中的代码会被执行.
  receives LuckyDipOp1 do
    puts tries
    abort! if tries > 2
    mutate.discount(state.discount + rand(-5..5))
    mutate.tries(state.tries + 1)
  end
end

class OfferLuckyDipDispatcher < Hyperloop::Component
  render(DIV) do
    # State 中的 state 方法自动定义了一个 reader 类方法.
    H1 { "Your discount is #{Discounter1.discount}%" }
    BUTTON { 'Lucky Dip' }.on(:click) do
      # 当 click button 时, LuckyDipOp1.run 将会激活所有订阅这个 Operation 的 State 操作.
      # 参见 https://github.com/cypriss/mutations
      LuckyDipOp1.run
    end
  end
end
