require_relative 'spec_helper'
require 'date'

describe Book do
  before :each do
    @book = Book.new 'Title', 'Publisher', 'good', '2021/12/12', 'false'
  end

  describe '#new' do
    it 'takes 5 parameters and returns a Book object' do
      @book.should be_an_instance_of Book
    end
  end

  describe '#title' do
    it 'returns the correct title' do
      @book.title.should eql 'Title'
    end
  end

  describe '#publisher' do
    it 'returns the correct publisher' do
      @book.publisher.should eql 'Publisher'
    end
  end

  describe '#cover_state' do
    it 'returns the correct publisher' do
      @book.cover_state.should eql 'good'
    end
  end

  describe '#publish_date' do
    it 'returns the correct publish_date' do
      @book.publish_date.should eql Date.parse('2021/12/12')
    end
  end

  describe '#archived' do
    it 'returns the correct archived' do
      @book.archived.should eql 'false'
    end
  end

  it 'should inherit behavior from Parent' do
    expect(Book.superclass).to eq(Item)
  end
end
