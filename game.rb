require './item'

class Game < Item
  attr_accessor :multiplayer, :last_played_at
end