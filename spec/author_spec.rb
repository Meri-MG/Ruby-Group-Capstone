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
  end
end
