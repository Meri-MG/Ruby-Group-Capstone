module CreateAuthor
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
end
