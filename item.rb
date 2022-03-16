require 'date'
require './genre'

class Item
  attr_accessor :publish_date, :genre, :author, :source, :label
  attr_writer :id

  def initialize(publish_date)
    @id = Random.rand(1..1000)
    @publish_date = Date.parse(publish_date)
  end

  def move_to_archive
    @archived = can_be_archived?
  end

  def add_genre(genre)
    @genre = genre
  end

  def add_author(author)
    @author = author
  end

  def add_source(source)
    @source = source
  end

  def add_label(label)
    @label = label
  end

  private

  def can_be_archived?
    d = Date.today
    d > publish_date.next_year(10)
  end
end
