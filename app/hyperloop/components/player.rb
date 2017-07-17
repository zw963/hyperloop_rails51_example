# 这个例子演示了如何方便的通过 webpacker 引入任何 js 库, 然后直接在 Components 中使用.

class Player < Hyperloop::Component
  render(DIV) do
    ReactPlayer(url: 'https://www.youtube.com/embed/Czrc1JfIBRw', playing: false)
  end
end
