require_relative '../item'

# rubocop:disable Style/ClassVars

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

  def self.overwrite_sources(sources)
    @@sources = sources
  end

  def to_s
    "Name: #{@name}, Items: #{@items}"
  end

  def add_item(item)
    @items << item
    item.source = self
  end
end

# rubocop:enable Style/ClassVars
