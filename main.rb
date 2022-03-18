require_relative './Movies-Source/class_functions'
require_relative './MusicAlbums-Genres/classes/music_album'
require_relative './MusicAlbums-Genres/classes/genre'
require_relative './MusicAlbums-Genres/classes/methods'
require_relative './Games-Authors/game'
require_relative './Games-Authors/author'
require_relative './Games-Authors/list_items'
require 'json'
require './item'

# rubocop: disable Metrics

class App
  include DataLayer
  include MusicAlbumModule

  def initialize
    @functions = Functions.new
    @methods = List.new
    @show = DisplayItems.new
    @games = []
    @authors = []
  end

  def run
    # Load files

    # Books
    books_path = Book.class_variable_get(:@@books_filename)
    Book.overwrite_books(read_data(books_path).map { |hash| hash_to_object(hash, 'Book') })

    labels_path = Label.class_variable_get(:@@labels_filename)
    Label.overwrite_labels(read_data(labels_path).map { |hash| hash_to_object(hash, 'Label') })

    movies_path = Movie.class_variable_get(:@@movies_filename)
    Movie.overwrite_movies(read_data(movies_path).map { |hash| hash_to_object(hash, 'Movie') })

    sources_path = Source.class_variable_get(:@@sources_filename)
    Source.overwrite_sources(read_data(sources_path).map { |hash| hash_to_object(hash, 'Source') })

    games_path = Game.class_variable_get(:@@games_filename)
    Game.overwrite_games(read_data(games_path).map { |hash| hash_to_object(hash, 'Game') })

    authors_path = Author.class_variable_get(:@@authors_filename)
    Author.overwrite_authors(read_data(authors_path).map { |hash| hash_to_object(hash, 'Author') })

    puts 'Welcome to your Catalog!'
    loop do
      list_of_options

      option_entry = gets.chomp.downcase

      break if option_entry == '0'

      option_chosen(option_entry)
    end

    puts 'Thanks for using our app!'

    @functions.save_on_exit
    @show.save_info
  end

  def list_of_options
    puts '',
         'Please choose an option by entering a number:',
         '1 - List all books',
         '2 - List all music albums',
         '3 - List all movies',
         '4 - List of games',
         '5 - List all genres (e.g "Comedy", "Thriller")',
         '6 - List all labels (e.g. "Gift", "New")',
         '7 - List all authors (e.g. "Stephen King")',
         '8 - List all sources (e.g. "From a friend", "Online shop")',
         '9 - Add a book',
         '10 - Add a music album',
         '11 - Add a movie',
         '12 - Add a game',
         '0 - Exit'
  end

  def option_chosen(option)
    case option
    when '1'
      @functions.list_books
    when '2'
      @methods.list_all_music_album
    when '3'
      @functions.list_movies
    when '4'
      @show.display_games
    when '5'
      @methods.list_all_genres
    when '6'
      @functions.list_labels
    when '7'
      @show.display_authors
    when '8'
      @functions.list_sources
    when '9'
      @functions.create_book
    when '10'
      @methods.add_music_album
    when '11'
      @functions.create_movie
    when '12'
      @show.create_game
    when '0'
      puts ''
    else
      puts 'Seems like an invalid entry!'
    end
  end
end

app = App.new
app.run

# rubocop: enable Metrics
