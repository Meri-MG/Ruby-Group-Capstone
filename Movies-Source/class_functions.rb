require_relative 'movie'
require_relative 'source'
require_relative 'preserve_data'

class Functions
  include DataLayer

  def list_movies
    Movie.class_variable_get(:@@movies).each_with_index do |movie, i|
      puts "#{i + 1}) #{movie}"
    end

    puts 'No available movies for the moment, please add one!' if Movie.class_variable_get(:@@movies).length.zero?
  end

  def list_sources
    Source.class_variable_get(:@@sources).each_with_index do |source, i|
      puts "#{i + 1}) #{source}"
    end

    puts 'No available sources for the moment!' if Source.class_variable_get(:@@sources).length.zero?
  end

  def create_movie
    print 'Please enter the title: '
    title = gets.chomp.downcase

    print 'Is it silent? [y/n]: '
    silent =  case gets.chomp.downcase
              when 'y'
                true
              when 'n'
                false
              else
                nil
              end

    print 'Please enter the release date (yyyy/mm/dd): '
    release_date = gets.chomp.downcase

    new_movie = Movie.new(title, silent, release_date)
    Movie.class_variable_get(:@@movies) << new_movie

    puts 'Movie created successfully'
  end

  def save_on_exit
    movies_path = Movie.class_variable_get(:@@movies_filename)
    movies_data = Movie.class_variable_get(:@@movies).map { |obj| object_to_hash(obj) }
    sources_path = Source.class_variable_get(:@@sources_filename)
    sources_data = Source.class_variable_get(:@@sources).map { |obj| object_to_hash(obj) }
    save_data(movies_path, movies_data)
    save_data(sources_path, sources_data)
  end
end
