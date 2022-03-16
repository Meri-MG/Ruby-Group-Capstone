require_relative '../item'
require_relative '../author'

describe Author do
  context 'Test Author class' do
    before(:all) do
      @new_author = Author.new('Lilian', 'Moraa')
      @new_item = Item.new('2022-05-03')
    end

    it 'Check instance of Author(new_author)' do
      expect(@new_author).to be_instance_of(Author)
    end

    it 'Check if items is empty' do
      expect(@new_author.show_items).to be_empty
    end

    it 'Checks if items are added to the array' do
      @new_author.add_item(@new_item)
      expect(@new_author.show_items).to match_array([@new_item])
    end

    it 'Checks if the author of new item is new author' do
      expect(@new_item.author).to eql @new_author
    end
  end
end