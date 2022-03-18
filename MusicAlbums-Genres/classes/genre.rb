class Genre
  attr_accessor :name
  attr_reader :arr_i, :id

  def initialize(name)
    @id = Random.rand(1..1000)
    @name = name
    @arr_i = []
  end

  def add_item(item)
    @arr_i << item
    item.genre = self
  end
end