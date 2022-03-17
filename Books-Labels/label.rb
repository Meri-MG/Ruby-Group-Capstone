require_relative '../item'

# rubocop:disable Style/ClassVars

class Label
  @@labels = []
  @@labels_filename = 'labels.json'
  @@id = 1

  attr_accessor :title, :color
  attr_reader :id, :items

  def initialize(title, color)
    @id = @@id
    @@id += 1
    @title = title
    @color = color
    @items = []
  end

  def add_item(item)
    @items << item
    item.label = self unless item.label == self
  end

  def self.overwrite_labels(arr)
    @@labels = arr
  end
end

# rubocop:enable Style/ClassVars
