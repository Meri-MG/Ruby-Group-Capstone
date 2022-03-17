class Genre
  attr_accessor :name, :arr_i

  @@id = 1

  def initialize(name)
    @id = @@id
    @@id += 1
    @name = name
    @arr_i = []
  end

  def add_item(item)
    @arr_i << item
    item.genre = self
  end
end
