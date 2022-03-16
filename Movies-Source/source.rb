require_relative '../item'

class Source
  attr_accessor :name
  attr_reader :id, :items

  @@sources = []
  @@sources_filename = 'sources.json'
  @@id = 1

  def initialize(name)
    @id = @@id
    @@id += 1
    @name = name
    @items = []
  end

  def add_item(item)
    @items << item
    item.source = self
  end
end