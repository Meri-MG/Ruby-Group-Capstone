module DisplayItems
  def display_games
    if @games.length.zero?
      puts 'Sorry! No games are registered!'
    else
      puts 'The List of all Games: \n'
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
    if @authors.length.zero?
      puts 'Sorry! There are no authors added!'
    else
      puts 'List of all Authors: \n'
      index = 0
      @authors.each do |author|
        puts "#{index}: Author: first_name: #{author.first_name} last_name: #{author.last_name}"
        index += 1
      end
    end
  end
  #   display music albums
  #  display albums
  #  display movies
  #  display books

  def display_more_details(item)
    puts "Genre: #{item.genre.name}" if item.genre
    puts "Author: first name: #{item.author.first_name} last name: #{item.author.last_name}" if item.author
    puts "Label : title: #{item.label.title} color: #{item.label.color}" if item.label
    puts "Source: #{item.source.name}" if item.source
  end
end
