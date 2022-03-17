require_relative './Movies-Source/class_functions'

# rubocop: disable Metrics

class App
  include DataLayer

  def initialize
    @functions = Functions.new
  end

  def run
    movies_path = Movie.class_variable_get(:@@movies_filename)
    Movie.overwrite_movies(read_data(movies_path).map { |hash| hash_to_object(hash, 'Movie') })

    puts 'Welcome to your Catalog!'

    loop do
      list_of_options

      option_entry = gets.chomp.downcase

      break if option_entry == '0'

      option_chosen(option_entry)
    end

    @functions.save_on_exit
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
      @functions.list_movies
    when '4'
      puts '4'
    when '5'
      puts '5'
    when '6'
      puts '6'
    when '7'
      puts '7'
    when '8'
      puts '8'
    when '9'
      puts '9'
    when '10'
      puts '10'
    when '11'
      @functions.create_movie
    when '12'
      puts '12'
    when '0'
      puts 'Exit'
    else
      puts 'Seems like an invalid entry!'
    end
  end
end

app = App.new
app.run

# rubocop: enable Metrics
