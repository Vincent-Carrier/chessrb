require_relative '../../src/pieces/knight'
require_relative '../spec_helpers'

RSpec.describe 'A knight' do
  let(:knight) { Knight.new :white }

  context 'on e4' do
    it 'moves in an L shape' do
      knight.sq = Sq 'e4'
      expected = <<~EOF
        ________
        ________
        ___X_X__
        __X___X_
        ________
        __X___X_
        ___X_X__
        ________
      EOF
      assert_range knight, expected
    end
  end

  context 'on e1' do
    it 'excludes squares outside the board' do
      knight.sq = Sq 'e1'
      expected = <<~EOF
        ________
        ________
        ________
        ________
        ________
        ___X_X__
        __X___X_
        ________
      EOF
      assert_range knight, expected
    end
  end
end
