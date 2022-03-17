require 'json'
require_relative '../classes/genre'

module MusicAlbumModule
  def load_genres
    data = []
    file = './json_files/genres.json'
    if File.exist?(file)
      JSON.parse(File.read(file)).each do |genre|
        data.push(Genre.new(genre['id'], genre['name']))
      end
    else
      File.write(file, [])
    end

    data
  end

  def create_genre
    data = []
    @music_albums.each do |genre|
      data.push({ id: genre.id, name: genre.name })
    end
    open('./json_files/genres.json', 'w') { |f| f << JSON.generate(data) }
  end
end
