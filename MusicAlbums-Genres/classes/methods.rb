require_relative '../modules/music_album_mule'
require_relative '../modules/genres_module'

class List
include MusicAlbumModule
def initialize
    @music_albums = load_music_albums
    @genres = load_genres
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
    load_genres.each do |genre|
      puts "Genre name: #{genre.name}"
    end
  end

  def add_music_album
    print 'Album name: '
    name = gets.chomp

    print 'Genre: '
    album_genre = gets.chomp

    print 'Date of publish [Enter date in format (yyyy-mm-dd)] '
    publish_date = gets.chomp

    print 'Is it available on Spotify? Y/N '
    on_spotify = gets.chomp.downcase == 'y' || false

    @music_albums.push(MusicAlbum.new(name, publish_date, on_spotify))
    puts 'Music album created'
    create_music_album

    @genres << Genre.new(album_genre)
    puts 'Genre created successfully'
    create_genre
  end
end