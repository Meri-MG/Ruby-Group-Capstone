require_relative 'spec_helper'
require 'date'

describe Source do
  context 'When testing the Source class' do
    name = 'This is the name of the source'
    source = Source.new name

    it 'is an instance of Source' do
      source.should be_an_instance_of Source
    end

    it 'has the correct name' do
      source.name.should eql name
    end

    it 'adds items to items array' do
      movie = Movie.new 'title', false, '2011/11/11', false
      source.add_item(movie)
      expect(source.items.include?(movie)).to eq true
      expect(movie.source).to eq source
    end
  end
end
