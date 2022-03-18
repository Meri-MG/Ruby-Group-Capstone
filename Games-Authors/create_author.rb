module CreateAuthor
  def create_author(item = nil)
    print 'first_name: '
    first_name = gets.chomp
    print 'last_name: '
    last_name = gets.chomp
    new_author = Author.new(first_name, last_name)
    new_author.add_item(item) unless item.nil?
    @authors << new_author
  end

  def create_game
    print 'publish_date: '
    publish_date = gets.chomp
    print 'multiplayer: '
    multiplayer = case gets.chomp
                  when 'Y', 'y'
                    true
                  when 'N', 'n'
                    false
                  end
    print 'last_played_at: '
    last_played_at = gets.chomp
    @games << Game.new(publish_date, multiplayer, last_played_at)
    puts 'Game Created'
  end
end
