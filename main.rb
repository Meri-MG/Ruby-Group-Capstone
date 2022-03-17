require_relative './MusicAlbums-Genres/classes/music_album'
require_relative './MusicAlbums-Genres/modules/music_album_mule'
# rubocop: disable Metrics

class App
  include MusicAlbumModule

  def initialize
    @music_albums = load_music_albums
    @load_genres = []
  end

  puts 'Welcome to your Catalog!'

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
         '13 - Exit'
  end

  # loop do
  #   list_of_options

  #   option_entry = gets.chomp.downcase

  #   break if option_entry == '0'

  #   option_chosen(option_entry)
  # end

  def option_chosen(option)
    case option
    when '1'
      puts '1'
    when '2'
      list_all_music_album
    when '3'
      puts '3'
    when '4'
      puts '4'
    when '5'
      list_all_genres
    when '6'
      puts '6'
    when '7'
      puts '7'
    when '8'
      puts '8'
    when '9'
      puts '9'
    when '10'
      add_music_album
    when '11'
      puts '11'
    when '12'
      puts '12'
    end
  end

  def list_all_music_album
    puts 'Music Albums'
    puts 'There are no Music albums yet' if @music_albums.empty?
    @music_albums.each do |music_album|
      puts "Name: #{music_album.name}, Publish Date: #{music_album.publish_date}, On Spotify: #{music_album.on_spotify}"
    end
  end

  def list_all_genres
    puts 'Genres'
    @load_genres.each do |genre|
      puts "Genre name: #{genre.name}"
    end
  end

  def add_music_album
    puts 'Album name: '
    name = gets.chomp

    puts 'Date of publish [Enter date in format (yyyy-mm-dd)]'
    publish_date = gets.chomp

    puts 'Is it available on Spotify? Y/N'
    on_spotify = gets.chomp.downcase == 'y' || false

    @music_albums.push(MusicAlbum.new(name, publish_date, on_spotify))
    puts 'Music album created'
  end

  def run
    option = 0
    while option.to_i < 13
      list_of_options
      option = gets.chomp
      option_chosen(option)
    end
    create_music_album
    puts 'Thanks for using our app'
  end
end

app = App.new
app.run

# rubocop: enable Metrics
