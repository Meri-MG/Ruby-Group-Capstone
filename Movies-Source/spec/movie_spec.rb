require_relative '../source'
require_relative '../movie'
require 'date'

describe Movie do
  context 'When testing the Movie class' do
    title = 'This is the name of the movie'
    silent = false
    publish_date = '2001/01/01'
    archived = true
    movie = Movie.new title, silent, publish_date, archived

    it 'is an instance of Movie' do
      movie.should be_an_instance_of Movie
    end

    it 'has the correct title' do
      movie.title.should eql title
    end

    it 'has the correct publish_date' do
      movie.publish_date.should eql Date.parse(publish_date)
    end

    it 'has the correct silent field' do
      expect(movie.silent).to eq silent
    end

    it 'has the correct archived field' do
      movie.archived.should eql archived
    end

    it 'should be an instance of a subclass of Item' do
      expect(movie.class.superclass).to eq(Item)
    end
  end
end
