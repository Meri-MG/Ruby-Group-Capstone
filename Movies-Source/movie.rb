require_relative '../item'

class Movie
  attr_accessor :silet
  attr_reader :title

  def initialize(title, silet, publish_date, archived = false)
    super(publish_date, archived)
    @title = title
    @silet = silet
  end
end