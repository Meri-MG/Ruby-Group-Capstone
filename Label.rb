require_relative './Item'

class Label
  attr_accessor :id, :title, :color 

  def initialize(id, title, color)
    @id = id
    @title = title
    @color = color
    @items = []
  end

  def add_item(item)
    item = Item.new
  end
end
