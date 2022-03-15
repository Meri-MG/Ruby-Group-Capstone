require 'date'

class Item
  attr_accessor :id, :publish_date, :archived
  attr_reader :label, :genre, :author, :source

  def initialize(id, publish_date, archived = false)
    @id = id || Random.rand(1..100)
    @publish_date = Date.parse(publish_date)
    # Date.parse('December 09, 2011').to_s
    @archived = archived
  end

  def can_be_archived?
    current_date = Date.today
    # year = ((current_date.to_time - @publish_date.to_time) / 1.year.seconds).floor
    year = current_date.year - @publish_date.year
    year >= 10
  end

  def move_to_archive
    @archived = true if can_be_archived?
  end

  def label=(label)
    @label = label
    label.items.push(self) unless label.items.include?(self)
  end

  def genre=(genre)
    @genre = genre
    genre.add_item(self) unless genre.items.include?(self)
  end

  def author=(author)
    @author = author
    author.items.push(self) unless author.items.include?(self)
  end

  def source=(source)
    @source = source
    source.items.push(self) unless source.items.include?(self)
  end
end

new_item = Item.new(12, '2020/10/19')
new_item.can_be_archived?

puts new_item.can_be_archived?
puts new_item.move_to_archive
