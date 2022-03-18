module DisplayItems
  def display_games
    if @games.length.zero?
      puts 'Sorry! No games are registered!'
    else
      puts 'The List of all Games: '
      index = 0
      @games.each do |game|
        print "#{index} - Game: "
        print "publish_date: #{game.publish_date} "
        print "multiplayer: #{game.multiplayer} "
        puts "last_played_at: #{game.last_played_at} "
        display_more_details(game)
        index += 1
      end
    end
  end

  def display_authors
    index = 0
    @authors.each do |author|
      puts "#{index}: Author: first_name: #{author.first_name} last_name: #{author.last_name}"
      index += 1
    end
  end
end
