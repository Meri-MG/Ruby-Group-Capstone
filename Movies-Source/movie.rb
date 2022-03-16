require_relative '../item'

class Movie
  def initialize(title, silet, publish_date, archived = false)
    super(publish_date, archived)
    @title = title
    @silet = silet
  end
end