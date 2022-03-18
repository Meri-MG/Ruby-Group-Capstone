require_relative 'spec_helper'
require 'date'

describe Label do
  before :each do
    @label = Label.new 'New', 'Purple'
  end

  describe '#new' do
    it 'takes 5 parameters and returns a label object' do
      @label.should be_an_instance_of Label
    end
  end

  describe '#label' do
    it 'returns the correct label' do
      @label.title.should eql 'New'
    end
  end

  describe '#color' do
    it 'returns the correct color' do
      @label.color.should eql 'Purple'
    end
  end

  it 'adds items to items array' do
    book = Book.new 'Title', 'Publisher', 'good', '2021/12/12'
    @label.add_item(book)
    expect(@label.items.include?(book)).to eq true
    expect(book.label).to eq @label
  end
end
