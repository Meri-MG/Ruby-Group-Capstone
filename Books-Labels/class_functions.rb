require_relative 'book'
require_relative 'label'
require_relative 'preserve_data'

class Functions
  include DataLayer

  def list_books
    Book.class_variable_get(:@@books).each_with_index.map do |book, i|
      puts "#{i + 1}) Title: #{book.title}, Publisher: #{book.publisher},
            Cover_state: #{book.cover_state}, Publish_date: #{book.publish_date}"
    end

    puts 'No available Books for the moment, please add one!' if Book.class_variable_get(:@@books).length.zero?
  end

  def list_labels
    Label.class_variable_get(:@@labels).each_with_index.map do |label, i|
      puts "#{i + 1}) Title: #{label.title}, Color: #{label.color}"
    end

    puts 'No available Labels for the moment!' if Label.class_variable_get(:@@labels).length.zero?
  end

  def create_book
    print 'Please, enter the title: '
    book_title = gets.chomp

    print 'Please, enter the publisher: '
    book_publisher = gets.chomp

    print 'Please, enter the cover state of the book: '
    book_state = gets.chomp.downcase

    print 'Please, enter the publish date in (yyyy/mm/dd) format: '
    book_date = gets.chomp

    new_book = Book.new(book_title, book_publisher, book_state, book_date)
    Book.class_variable_get(:@@books) << new_book

    puts 'Book created successfully'
  end

  def save_on_exit
    books_path = Book.class_variable_get(:@@books_filename)
    books_data = Book.class_variable_get(:@@books).map { |obj| object_to_hash(obj) }
    labels_path = Label.class_variable_get(:@@labels_filename)
    labels_data = Label.class_variable_get(:@@labels).map { |obj| object_to_hash(obj) }
    save_data(books_path, books_data)
    save_data(labels_path, labels_data)
  end
end
