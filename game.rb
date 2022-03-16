require './item'

class Game < Item
  attr_accessor :multiplayer, :last_played_at

  def initialize(publish_date, multiplayer, last_played_at)
    super(publish_date)
    @multiplayer = multiplayer
    @last_played_at = Date.parse(last_played_at)
  end

  def to_json(*args)
    {
      JSON.create_id => self.class.name,
      'id' => @id,
      'multiplayer' => @multiplayer,
      'publish_date' => @publish_date,
      'last_played_at' => @last_played_at
    }.to_json(*args)
  end

  private

  def can_be_archived?()
    today_date = Date.today
    super() && @last_played_at.next_year(2) < today_date
  end
end
