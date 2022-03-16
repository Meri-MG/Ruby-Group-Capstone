require 'date'

# rubocop:disable Style/ClassVars

class Item
  @@id = 1

  attr_accessor :publish_date
  attr_reader :id, :archived, :label, :genre, :author, :source

  def initialize(publish_date, archived: false)
    @id = @@id
    @@id += 1
    @publish_date = Date.parse(publish_date)
    @archived = archived
  end

  def label=(label)
    @label = label
    @label.add_item(self) unless @label.items.include?(self)
  end

  def genre=(genre)
    @genre = genre
    @genre.add_item(self) unless @genre.items.include?(self)
  end

  def author=(author)
    @author = author
    author.items.push(self) unless @author.items.include?(self)
  end

  def source=(source)
    @source = source
    @source.add_item(self) unless @source.items.include?(self)
  end

  def move_to_archive
    @archived = true if can_be_archived?
  end

  private

  def can_be_archived?
    current_date = Date.today

    return unless current_date.year - @publish_date.year >= 10

    current_date.month < @publish_date.month
  end
end

# rubocop:enable Style/ClassVars
