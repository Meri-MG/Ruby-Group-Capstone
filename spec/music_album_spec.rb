require_relative '../music_album'
require_relative '../item'
require_relative '../genre'

describe 'Create a MusicAlbum' do
  before :each do
    @music_album = MusicAlbum.new('01-01-2020', true)
  end

  describe 'music_album is an instance of MusicAlbum' do
    it 'is an instance of MusicAlbum' do
      expect(@music_album).to be_instance_of MusicAlbum
    end

    it 'show inheritance from Item class' do
      expect(@music_album).to be_kind_of(Item)
    end

    it 'shows archived to be false' do
      expect(@music_album.move_to_archive).to be false
    end

    it 'shows on_spotify to be true' do
      expect(@music_album.on_spotify).to be true
    end
  end
end
