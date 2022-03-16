module DisplayItems
  def display_games
    if @games.length.zero?
      puts 'Sorry! There is no games registered!'.upcase
    else
      puts 'List of all Games: \n'
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

  def display_music_albums
    if @music_albums.length.zero?
      puts 'Sorry! There is no music album registered!'.upcase
    else
      puts 'List of all Music albums: \n'
      index = 0
      @music_albums.each do |album|
        puts "#{index} - Album: Publish date: #{album.publish_date}, On Spotify: #{album.on_spotify}"
        display_more_details(album)
        index += 1
      end
    end
  end

  def display_movies
    if @movies.length.zero?
      puts 'Sorry! There is no movies registered!'.upcase
    else
      puts 'List of all Movies: \n'
      index = 0
      @movies.each do |movie|
        print "#{index} - movie: "
        print "publish_date: #{movie.publish_date} "
        puts "multiplayer: #{movie.silet} "
        display_more_details(movie)
        index += 1
      end
    end
  end

  def display_books
    if @books.length.zero?
      puts 'Sorry! There is no book registered!'.upcase
    else
      puts 'List of all Books: \n'
      index = 0
      @books.each do |book|
        print "#{index} - book: "
        print "publish_date: #{book.publish_date} "
        print "publisher: #{book.publisher} "
        puts "cover_state: #{book.cover_state} "
        display_more_details(book)
        index += 1
      end
    end
  end

  def display_more_details(item)
    puts "Genre: #{item.genre.name}" if item.genre
    puts "Author: first name: #{item.author.first_name} last name: #{item.author.last_name}" if item.author
    puts "Label : title: #{item.label.title} color: #{item.label.color}" if item.label
    puts "Source: #{item.source.name}" if item.source
  end
end
