require_relative '../item'

# rubocop:disable Style/ClassVars
# rubocop:disable Style/OptionalBooleanParameter

class Game < Item
  @@games = []
  @@games_filename = 'games.json'

  attr_accessor :multiplayer, :last_played_at, :publish_date

  def initialize(publish_date, multiplayer, last_played_at, archived = false)
    super(publish_date, archived)
    @multiplayer = multiplayer
    @last_played_at = Date.parse(last_played_at)
  end

  def self.overwrite_games(arr)
    @@games = arr
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

  protected

  def can_be_archived?()
    current_date = Date.today
    super && @last_played_at.year(2) < current_date
  end
end

# rubocop:enable Style/ClassVars
# rubocop:enable Style/OptionalBooleanParameter
