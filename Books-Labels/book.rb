require_relative '../item'

# rubocop:disable Style/ClassVars

class Book < Item
  @@books = []
  @@books_filename = 'books.json'

  attr_accessor :title, :publisher, :cover_state, :publish_date

  def initialize(title, publisher, cover_state, publish_date, _archived = false)
    super(publish_date, archived = false)
    @title = title
    @publisher = publisher
    @cover_state = cover_state
  end

  def self.overwrite_books(arr)
    @@books = arr
  end

  private

  def can_be_archived?
    if can_be_archived? || @cover_state == 'bad'
      @achived = true
    else
      @archived = false
    end
  end
end

# rubocop:enable Style/ClassVars