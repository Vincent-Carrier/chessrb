require './src/pieces/knight'
require './spec_helpers'

RSpec.describe 'A knight' do
  let(:knight) { Knight.new :white }

  context 'on e4' do
    it 'moves in an L shape' do
      knight.sq = Sq 'e4'
      expected = <<~EOF
        ········
        ········
        ···X·X··
        ··X···X·
        ········
        ··X···X·
        ···X·X··
        ········
      EOF
      assert_range knight, expected
    end
  end

  context 'on e1' do
    it 'excludes squares outside the board' do
      knight.sq = Sq 'e1'
      expected = <<~EOF
        ········
        ········
        ········
        ········
        ········
        ···X·X··
        ··X···X·
        ········
      EOF
      assert_range knight, expected
    end
  end
end
