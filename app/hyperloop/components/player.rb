class Player < React::Component::Base
  imports 'ReactPlayer'
end

class LiftOff < Hyperloop::Component
  render(DIV) do
    Player(url: 'https://www.youtube.com/embed/Czrc1JfIBRw', playing: false)
  end
end
