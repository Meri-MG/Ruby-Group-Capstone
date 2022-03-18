# rubocop: disable Metrics
require 'json'
require_relative './Games-Authors/game'
require_relative './item'
require_relative './Games-Authors/author'
require_relative './Games-Authors/create_author'
require_relative './Games-Authors/list_items'
require_relative './Games-Authors/preserve_data'

class App
  include CreateAuthor
  include DisplayItems
  include CreateAuthor

  include DataLayer

  def initialize
    @games = []
    @authors = []
    puts 'Welcome to Catalog My Things App!'
    puts
  end

  def run
    games_path = Game.class_variable_get(:@@games_filename)
    Game.overwrite_games(read_data(games_path).map { |hash| hash_to_object(hash, 'Game') })
    @games = Game.class_variable_get(:@@games)

    authors_path = Author.class_variable_get(:@@authors_filename)
    Author.overwrite_authors(read_data(authors_path).map { |hash| hash_to_object(hash, 'Author') })
    @authors = Author.class_variable_get(:@@authors)

    loop do
      list_of_options

      option_entry = gets.chomp.downcase

      break if option_entry == '0'

      option_chosen(option_entry)
    end

    Game.overwrite_games(@games)
    Author.overwrite_authors(@authors)

    games_path = Game.class_variable_get(:@@games_filename)
    games_data = Game.class_variable_get(:@@games).map { |obj| object_to_hash(obj) }
    authors_path = Author.class_variable_get(:@@authors_filename)
    authors_data = Author.class_variable_get(:@@authors).map { |obj| object_to_hash(obj) }
    save_data(games_path, games_data)
    save_data(authors_path, authors_data)
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
      puts '1'
    when '2'
      puts '2'
    when '3'
      puts '3'
    when '4'
      display_games
    when '5'
      puts '5'
    when '6'
      puts '6'
    when '7'
      display_authors
    when '8'
      puts '8'
    when '9'
      puts '9'
    when '10'
      puts '10'
    when '11'
      puts '11'
    when '12'
      create_game
    when '0'
      puts 'E'
    else
      puts 'Seems like an invalid entry!'
    end
  end
end

app = App.new
app.run

# rubocop: enable Metrics
