require_relative '../Movies-Source/preserve_data'

class DisplayItems
  include DataLayer

  def display_games
    if Game.class_variable_get(:@@games).length.zero?
      puts 'Sorry! No games are registered!'
    else
      puts 'The List of all Games: '
      index = 0
      Game.class_variable_get(:@@games).each do |game|
        print "#{index} - Game: "
        print "publish_date: #{game.publish_date} "
        print "multiplayer: #{game.multiplayer} "
        puts "last_played_at: #{game.last_played_at} "
        # display_more_details(game)
        index += 1
      end
    end
  end

  def display_authors
    index = 0
    Author.class_variable_get(:@@authors).each do |author|
      puts "#{index}: first_name: #{author.first_name} last_name: #{author.last_name}"
      index += 1
    end
  end

  def create_game
    print 'publish_date [yyyy/mm/dd]: '
    publish_date = gets.chomp
    print 'multiplayer Y/N: '
    multiplayer = case gets.chomp
                  when 'Y', 'y'
                    true
                  when 'N', 'n'
                    false
                  end
    print 'last_played_at [yyyy/mm/dd]: '
    last_played_at = gets.chomp
    new_game = Game.new(publish_date, multiplayer, last_played_at)
    Game.class_variable_get(:@@games) << new_game
    puts 'Game Created'
  end

  def save_info
    games_path = Game.class_variable_get(:@@games_filename)
    games_data = Game.class_variable_get(:@@games).map { |obj| object_to_hash(obj) }
    authors_path = Author.class_variable_get(:@@authors_filename)
    authors_data = Author.class_variable_get(:@@authors).map { |obj| object_to_hash(obj) }
    save_data(games_path, games_data)
    save_data(authors_path, authors_data)
  end
end
