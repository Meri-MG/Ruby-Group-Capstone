require './item'

class Game < Item
  attr_accessor :multiplayer, :last_played_at

  def initialize(publish_date, multiplayer, last_played_at)
    super(publish_date)
    @multiplayer = multiplayer
    @last_played_at = Date.parse(last_played_at)
  end
  private

  def can_be_archived?()
    today_date = Date.today
    super() && @last_played_at.next_year(2) < today_date
  end
end
