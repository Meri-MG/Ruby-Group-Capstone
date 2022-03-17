require_relative '../item'

# rubocop:disable Style/ClassVars
# rubocop:disable Style/OptionalBooleanParameter

class Movie < Item
  @@movies = []
  @@movies_filename = 'movies.json'

  attr_accessor :silent
  attr_reader :title

  def initialize(title, silent, publish_date, archived = false)
    super(publish_date, archived)
    @title = title
    @silent = silent
  end

  def self.overwrite_movies(movies)
    @@movies = movies
  end

  def to_s
    "Title: #{@title}, Silent: #{@silent}, Publish_date: #{@publish_date}"
  end

  protected

  def can_be_archived?
    super || @silent
  end
end

# rubocop:enable Style/ClassVars
# rubocop:enable Style/OptionalBooleanParameter
