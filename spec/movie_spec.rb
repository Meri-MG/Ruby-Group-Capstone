require_relative '../movie'
require_relative '../item'
describe Movie do
  context 'Testing movie Class:' do
    before(:all) do
      @new_movie = Movie.new('2010-2-2', 'yes')
    end

    it 'The new_movie object is an instance of Movie' do
      expect(@new_movie).to be_instance_of Movie
    end

    it 'The new_movie object is an instance of (Inherted from) Item' do
      expect(@new_movie).to be_kind_of Item
    end

    it 'Archived to be false as last_played_at is not from more than tow years ago' do
      expect(@new_movie.move_to_archive).to be true
    end
  end
end
