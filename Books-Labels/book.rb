require_relative '../item'

# rubocop:disable Style/ClassVars
# rubocop:disable Style/OptionalBooleanParameter

class Book < Item
  @@books = []
  @@books_filename = 'books.json'

  attr_accessor :title, :publisher, :cover_state, :publish_date

  def initialize(title, publisher, cover_state, publish_date, archived = false)
    super(publish_date, archived)
    @title = title
    @publisher = publisher
    @cover_state = cover_state
  end

  def self.overwrite_books(arr)
    @@books = arr
  end

  protected

  def can_be_archived?
    super || @cover_state == 'bad'
  end
end

# rubocop:enable Style/ClassVars
# rubocop:enable Style/OptionalBooleanParameter
