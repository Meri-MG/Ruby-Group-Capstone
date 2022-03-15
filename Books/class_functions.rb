require_relative './book'
require_relative './label'
require_relative './preserve_data'

class Functions
  include DataLayer
  def initialize
    @people = []
    @rentals = []
  end
  def list_books
    Book.class_variable_get(:@@books).each_with_index.map do |book, i|
      puts "#{i}) Title: #{book.title}, Author: #{book.author} "
    end
  end
end