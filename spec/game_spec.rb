require_relative '../game'
require_relative '../item'
describe Game do
  context 'Test class game:' do
    before(:all) do
      @new_game = Game.new('2010-03-05', 'yes', '2021-03-06')
    end
end