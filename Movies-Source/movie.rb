require_relative '../item'

class Movie
  @@movies = []
  @@movies_filename = 'movies.json'

  attr_accessor :silet
  attr_reader :title

  def initialize(title, silent, publish_date, archived = false)
    super(publish_date, archived)
    @title = title
    @silent = silent
  end

  def self.overwrite_movies(movies)
    @@books = movies
  end

  protected

  def can_be_archived?
    super || @silent
  end
end
