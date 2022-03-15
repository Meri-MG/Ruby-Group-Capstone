require_relative '../item'

class Book < Item
  @@books = []
  @@books_filename = 'books.json'

  attr_accessor :title, :publisher, :cover_state

  def initialize(title, publisher, cover_state, publish_date)
    super(id: nil, publish_date: publish_date, archived: false)
    @title = title
    @publisher = publisher
    @cover_state = cover_state
  end

  def can_be_archived?
    if can_be_archived? || @cover_state == 'bad'
      @achived = true
    else
      @archived = false
    end
  end

  def self.overwrite_books(arr)
    @@books = arr
  end
end
