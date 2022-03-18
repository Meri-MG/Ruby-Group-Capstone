module CreateAuthor
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
