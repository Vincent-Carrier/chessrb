require_relative '../src/pieces/large_pieces'
require_relative 'spec_helpers'

fdescribe 'A bishop on e4' do
  let(:bishop) { Bishop.new :white, Sq('e4') }

  it 'moves diagonally' do
    expected = <<~EOF
      X_______
      _X_____X
      __X___X_
      ___X_X__
      ________
      ___X_X__
      __X___X_
      _X_____X
    EOF
    assert_range bishop, expected
  end
end
