class Helloworld < Hyperloop::Component
  # 注意, 下面的状态, 是如何设定默认值的. (必须有默认值!)
  state show_field: false
  state field_value: ''

  render(DIV) do
    show_button
    if state.show_field
      DIV(class: 'formdiv') do
        show_input
        show_text
      end
    end
  end

  def show_button
    BUTTON(class: 'btn btn-info') do
      state.show_field ? 'Click to hide HelloWorld input field' : 'Click to show HelloWorld input field'
    end.on(:click) { mutate.show_field !state.show_field }
  end

  def show_input
    H4 do
      SPAN { 'Please type ' }
      SPAN(class: 'colored') { 'Hello World' }
      SPAN { ' in the input field below :' }
      BR {}
      SPAN { 'Or anything you want (^̮^)' }
    end

    INPUT(type: :text, class: 'form-control').on(:change) do |e|
      # 注意是如何改变一个状态的. mutate.state_name
      mutate.field_value e.target.value
    end
  end

  def show_text
    # 下面是如何访问一个定义的状态的. state.state_name
    H1 { state.field_value }
  end
end
