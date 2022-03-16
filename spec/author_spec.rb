require_relative '../item'
require_relative '../author'

describe Author do
  context 'Testing Author Class' do
    before(:all) do
      @new_author = Author.new('Ahmad', 'Mahmmod')
      @new_item = Item.new('2020-10-10')
    end

    it 'new_author is an instance of Author' do
      expect(@new_author).to be_instance_of(Author)
    end

    it 'items is empty' do
      expect(@new_author.show_items).to be_empty
    end

    it 'Should add item to Items array' do
      @new_author.add_item(@new_item)
      expect(@new_author.show_items).to match_array([@new_item])
    end

    it 'The author of new_item should be new_author' do
      expect(@new_item.author).to eql @new_author
    end
  end
end
