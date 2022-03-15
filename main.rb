class App
  def run
    puts 'Welcome to your Catalog!'

    loop do
      list_of_options

      option_entry = gets.chomp.downcase

      break if option_entry == '0'

      option_chosen(option_entry)
    end
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
      puts '11'
    when '12'
      puts '12'
    when '0'
      puts 'E'
    else
      puts 'Seems like an invalid entry!'
    end
  end
end

app = App.new
app.run
