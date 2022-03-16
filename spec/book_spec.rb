require_relative '../book'
require_relative '../item'

describe Book do
  context 'Testing Author Class' do
    before(:all) do
      @new_book = Book.new('2021-11-11', 'yannick', 'good')
      @new_item = Item.new('2020-10-10')
    end

    it 'new_book is an instance of Book' do
      expect(@new_book).to be_instance_of(Book)
    end

    it 'The new_book object is an instance of  Item' do
      expect(@new_book).to be_kind_of Item
    end

    it 'Check the publisher of the book' do
      expect(@new_book.publisher).to eql 'yannick'
    end

    it 'Check the cover_state of the book' do
      expect(@new_book.cover_state).to eql 'good'
    end

    it 'Check the can_be_archived? method of the Book class' do
      expect(@new_book.send(:can_be_archived?)).to be true
    end
  end
end
