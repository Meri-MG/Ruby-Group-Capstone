require_relative '../classes/music_album'

require 'yaml'

describe MusicAlbum do
  before :each do
    @music = MusicAlbum.new('name', '2002-01-01', true)
  end

  it 'music should be an instance of Music class' do
    expect(@music).to be_an_instance_of MusicAlbum
  end

  it 'music should be an archived' do
    expect(@music.name).to eql 'name'
  end

  it 'music should be an archived' do
    expect(@music.publish_date).to be # <Date: 2002-01-01 ((2452276j,0s,0n),+0s,2299161j)>
  end

  it 'music should be an archived' do
    expect(@music.can_be_archived?).to be false
  end
end
