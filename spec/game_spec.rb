require_relative '../game'
require_relative '../item'
describe Game do
  context 'Testing Game Class:' do
    before(:all) do
      @new_game = Game.new('2010-2-2', 'yes', '2021-10-10')
    end

    it 'The new_game object is an instance of Game' do
      expect(@new_game).to be_instance_of Game
    end

    it 'The new_game object is an instance of (Inherted from) Item' do
      expect(@new_game).to be_kind_of Item
    end

    it 'Archived to be false as last_played_at is not from more than tow years ago' do
      expect(@new_game.move_to_archive).to be false
    end
  end
end
