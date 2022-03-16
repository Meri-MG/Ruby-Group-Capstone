# rubocop:disable Style/GuardClause
# rubocop:disable Metrics/ModuleLength
module CreateItems
  def create_game
    print 'publish_date:'
    publish_date = gets.chomp
    print 'multiplayer'
    multiplayer = gets.chomp
    print 'last_played_at'
    last_played_at = gets.chomp
    @games << Game.new(publish_date, multiplayer, last_played_at)
    puts 'Game Created'
    create_associations(@games[-1])
  end

  def create_music_album
    puts

    print 'Published date: '
    publish_date = gets.chomp

    print 'On spotify? [y/n]: '
    on_spotify = gets.chomp != 'n'

    music = MusicAlbum.new(publish_date, on_spotify)
    @music_albums << music

    puts
    puts 'Music album is created succussfully!'
    puts
    create_associations(@music_albums[-1])
  end

  def create_book
    print 'Published date: '
    publish_date = gets.chomp

    print 'Publisher name: '
    publisher = gets.chomp

    print 'Cover state: '
    cover_state = gets.chomp

    @books << Book.new(publish_date, publisher, cover_state)
    puts 'Book has been added successfully'
    create_associations(@books[-1])
  end

  def create_movie
    print 'Published date: '
    publish_date = gets.chomp

    print 'Silet: '
    silet = gets.chomp

    @movies << Movie.new(publish_date, silet)
    puts 'Movie has been added successfully'
    create_associations(@movies[-1])
  end

  def create_genre(item = nil)
    print 'Genre name: '
    genre = gets.chomp
    puts 'Genre has been added successfully'
    @genres << Genre.new(genre) if item.nil?
    new_genre = Genre.new(genre)
    new_genre.add_item(item)
    @genres << new_genre
  end

  def create_author(item = nil)
    print 'first_name:'
    first_name = gets.chomp
    print 'last_name'
    last_name = gets.chomp
    @authors << Author.new(first_name, last_name) if item.nil?
    new_author = Author.new(first_name, last_name)
    new_author.add_item(item)
    @authors << new_author
  end

  def create_label(item = nil)
    print 'title:'
    title = gets.chomp
    print 'color:'
    color = gets.chomp
    @labels << Label.new(title, color) if item.nil?
    new_label = Label.new(title, color)
    new_label.add_item(item)
    @labels << new_label
  end

  def create_source(item = nil)
    print 'name:'
    name = gets.chomp
    @sources << Source.new(name) if item.nil?
    new_source = Source.new(name)
    new_source.add_item(item)
    @sources << new_source
  end

  # rubocop:disable Metrics/MethodLength
  # rubocop:disable Metrics/AbcSize
  # rubocop:disable Metrics/CyclomaticComplexity
  # rubocop:disable Metrics/PerceivedComplexity
  def create_associations(item)
    puts 'Do you want to add any association [y/n]:'
    input = gets.chomp != 'n'
    if input
      puts 'What association do you want to add to the created item:'
      puts '[1]: Genre, [2]:Source, [3]:Label, [4]:Author, [5]:Back'
      association = gets.chomp.to_i
      case association
      when 1
        puts 'Do you want to create a new Genre[y] or use an exsisting one[n] [y/n]:'
        input = gets.chomp != 'n'
        if input
          create_genre(item)
        else
          puts 'Select a genre by index:'
          display_genres
          genre_index = gets.chomp.to_i
          @genres[genre_index].add_item(item)
          puts 'item has been added to genre'
        end
      when 2
        puts 'Do you want to create a new Source[y] or use an exsisting one[n] [y/n]:'
        input = gets.chomp != 'n'
        if input
          create_source(item)
        else
          puts 'Select a Source by index:'
          display_sources
          source_index = gets.chomp.to_i
          @sources[source_index].add_item(item)
          puts 'item has been added to source'
        end
      when 3
        puts 'Do you want to create a new Label[y] or use an exsisting one[n] [y/n]:'
        input = gets.chomp != 'n'
        if input
          create_label(item)
        else
          puts 'Select a Label by index:'
          display_labels
          label_index = gets.chomp.to_i
          @labels[label_index].add_item(item)
          puts 'item has been added to label'
        end
      when 4
        puts 'Do you want to create a new Author[y] or use an exsisting one[n] [y/n]:'
        input = gets.chomp != 'n'
        if input
          create_author(item)
        else
          puts 'Select a Label by index:'
          display_authors
          author_index = gets.chomp.to_i
          @authors[author_index].add_item(item)
          puts 'item has been added to Author'
        end
      else
        puts
      end
      create_associations(item)
    end
  end
end
# rubocop:enable Metrics/AbcSize
# rubocop:enable Metrics/CyclomaticComplexity
# rubocop:enable Metrics/PerceivedComplexity
# rubocop:enable Metrics/MethodLength
# rubocop:enable Style/GuardClause
# rubocop:enable Metrics/ModuleLength
