require_relative '../game'
require_relative '../item'
describe Game do
  context 'Test class game:' do
    before(:all) do
      @new_game = Game.new('2018-03-05', 'yes', '2022-03-06')
    end
    it 'Check intsance of game()new_game' do
      expect(@new_game).to be_instance_of Game
    end

    it 'Check if new game is inherited from item' do
      expect(@new_game).to be_kind_of Item
    end

    it 'Make new_game archived false since its from beyond two years ago' do
      expect(@new_game.move_to_archive).to be false
    end
  end
end
