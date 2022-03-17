class Genre
  attr_accessor :name, :items

  @@id = 1

  def initialize(name)
    @id = @@id
    @@id += 1
    @name = name
    @items = []
  end

  def add_item(item)
    @items << item unless @items.include?(item)
    item.genre = self
  end
end
