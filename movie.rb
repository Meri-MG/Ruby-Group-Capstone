require_relative './item'

class Movie < Item
  attr_accessor :silet

  def initialize(publish_date, silet)
    super(publish_date)
    @silet = silet
  end

  def to_json(*args)
    {
      JSON.create_id => self.class.name,
      'id' => @id,
      'publish_date' => @publish_date,
      'silet' => @silet
    }.to_json(*args)
  end

  private

  def can_be_archived?
    super() || @silet
  end
end
