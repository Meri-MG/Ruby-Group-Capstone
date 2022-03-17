module AuthorJsonHandle
        def save_files
          File.open('games.json', 'w') { |file| file.write(@games.to_json) }
          File.open('authors.json', 'w') { |file| file.write(@authors.to_json) }
        end
      
        
        def open_games
          if File.exist?('games.json')
            JSON.parse(File.read('games.json')).map do |game|
              game_object = create_game_object(game)
              @games << game_object
            end
          end
        end
      
        # rubocop:enable Style/GuardClause
        def create_game_object(game)
          new_object = Game.new(game['publish_date'], game['multiplayer'], game['last_played_at'])
          new_object.id = game['id'].to_i
          new_object
        end
      
      end