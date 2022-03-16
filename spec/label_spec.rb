require_relative '../label'
require 'date'
require_relative '../item'

describe Label do
  context 'Testing Author Class' do
    before(:all) do
      @new_label = Label.new('color1', 'white')
      @new_item = Item.new('2020-10-10')
    end

    it 'new_label is an instance of Label' do
      expect(@new_label).to be_instance_of(Label)
    end

    it 'Check the color of the label' do
      expect(@new_label.color).to eql 'white'
    end

    it 'Check the title of the label' do
      expect(@new_label.title).to eql 'color1'
    end

    it 'Add method to' do
      @new_label.add_item(@new_item)
      expect(@new_label.items).to include(@new_item)
    end
  end
end
