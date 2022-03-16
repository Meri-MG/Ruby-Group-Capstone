require_relative '../genre'
require_relative '../item'
require_relative '../music_album'

describe 'Create a Genre' do
  before :each do
    @genre = Genre.new('Hiphop')
    @item = Item.new('2020-02-02')
  end

  describe 'genre is an instance of Genre' do
    it 'is an instance of Genre' do
      expect(@genre).to be_instance_of(Genre)
    end

    it 'items is an empty array' do
      expect(@genre.show_items).to be_empty
    end

    it 'should add item to add_item method' do
      @genre.add_item(@item)
      expect(@genre.show_items).to match_array([@item])
    end

    it 'should add item to add_item method' do
      @genre.add_item(@item)
      expect(@item.genre).to eql @genre
    end
  end
end
