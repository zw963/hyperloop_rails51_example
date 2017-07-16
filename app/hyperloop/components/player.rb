class Player < Hyperloop::Component
  render(DIV) do
    ReactPlayer(url: 'https://www.youtube.com/embed/Czrc1JfIBRw', playing: false)
  end
end
