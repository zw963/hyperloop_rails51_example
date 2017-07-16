# 这个类名称原本是: TopLevelComponent, 代表顶级组件, 用来包含其他组件的组件.
# 但是直接用这个名字, 因为 share_a_store 不存在 ShareAStore 这个类, 不工作, 因此改名.
class ShareAStore < Hyperloop::Component
  render do
    DIV(class: 'container') do
      H1 { 'Components sharing a Store' }
      TypeAlong()
      Buttons()
    end
  end
end

class MyStore < Hyperloop::Store
  state :value, reader: true, scope: :class
  # 改变状态的类方法, 使用 ! 结尾, 这是一个惯例.
  def self.set_value!(value)
    mutate.value value
  end

  def self.clear!
    mutate.value ''
  end
end

# 这个例子的目的是: 下列两个 Component 同时在 读取/操作 MyStore.

class TypeAlong < Hyperloop::Component
  render(DIV) do
    # INPUT 的 onchange 事件触发时(即, 键入内容时), 修改 MyStore 的状态
    # 一旦修改, 所有引用了 State 的组件, 这里是: TypeAlong 和 Button 组件
    # 都会自动 render 刷新.
    INPUT(type: :text, value: MyStore.value).on(:change) do |e|
      MyStore.set_value! e.target.value
    end
    P { MyStore.value }
  end
end

class Buttons < Hyperloop::Component
  render(DIV) do
    BUTTON(class: 'btn btn-primary') { 'See the value' }.on(:click) do
      alert "MyStore value is '#{MyStore.value}'"
    end
    # 这里清除了 MyStore 的 State, 同样会引起 TypeAlong 的自动刷新.
    BUTTON(class: 'btn btn-link') { 'Clear' }.on(:click) do
      MyStore.clear!
    end
  end
end
