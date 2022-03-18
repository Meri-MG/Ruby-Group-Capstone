module AuthorJsonHandle
  def save_files
    File.write('games.json', @games.to_json)
    File.write('authors.json', @authors.to_json)
  end

  def open_games
    if File.exist?('games.json')
      JSON.parse(File.read('games.json')).map do |game|
        game_object = create_game_object(game)
        @games << game_object
      end
    end
  end

  def create_game_object(game)
    new_object = Game.new(game['publish_date'], game['multiplayer'], game['last_played_at'])
    new_object.id = game['id'].to_i
    new_object
  end

  def open_authors
    if File.exist?('authors.json')
      JSON.parse(File.read('authors.json')).map do |author|
        author_object = create_author_object(author)
        @authors << author_object
      end
    end
  end

  def create_author_object(author)
    new_object = Author.new(author['first_name'], author['last_name'])
    new_object.id = author['id'].to_i
    new_object
  end
end
