require_relative '../item'
require_relative '../source'

describe Source do
  context 'Testing Source Class' do
    before(:all) do
      @new_source = Source.new('Suit')
      @new_item = Item.new('2020-01-10')
    end

    it 'new_source is an instance of source' do
      expect(@new_source).to be_instance_of(Source)
    end

    it 'items is empty' do
      expect(@new_source.show_items).to be_empty
    end

    it 'Should add item to Items array' do
      @new_source.add_item(@new_item)
      expect(@new_source.show_items).to match_array([@new_item])
    end

    it 'The source of new_item should be new_source' do
      expect(@new_item.source).to eql @new_source
    end
  end
end
