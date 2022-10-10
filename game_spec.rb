require './game.rb'

describe Game do
  it 'should win game' do
    expect(Game.new(0, 2, true).play).to eq :win
    expect(Game.new(2, 1, true).play).to eq :win
    expect(Game.new(1, 1, false).play).to eq :win
  end

  it 'should lose game' do
    expect(Game.new(0, 2, false).play).to eq :lose
    expect(Game.new(2, 1, false).play).to eq :lose
    expect(Game.new(1, 1, true).play).to eq :lose
  end
end