# rubocop:disable Style/ClassVars

class Genre
  @@id = 1
  attr_accessor :name
  attr_reader :items, :id

  def initialize(name)
    @id = @@id
    @@id += 1
    @name = name
    @items = []
  end

  def add_item(item)
    @items << item
    item.genre = self
  end
end

# rubocop:enable Style/ClassVars
