require 'rails_helper'

RSpec.describe Piece, type: :model do
  describe '.new' do
    let!(:piece) { FactoryBot.create :piece }

    it 'is valid' do
      expect(piece).to be_valid
    end
  end

  describe 'move' do
    let!(:piece) { FactoryBot.create :piece }
    it '#horizontal_move? returns true if move is horizontal' do
      result = piece.horizontal_move?(1, 2, 4, 2)
      expect(result).to eq true
    end

    it '#horizontal_move? returns false if move is not horizontal' do
      result = piece.horizontal_move?(2, 5, 3, 4)
      expect(result).to eq false
    end

    it '#vertical_move? returns true if move is vertical' do
      result = piece.vertical_move?(1, 1, 1, 3)
      expect(result).to eq true
    end

    it '#vertical_move? returns false if move is not vertical' do
      result = piece.vertical_move?(1, 2, 2, 2)
      expect(result).to eq false
    end

    it '#diagonal_move? returns true if move is diagonal' do
      result = piece.diagonal_move?(1, 2, 3, 4)
      expect(result).to eq true
    end

    it '#diagonal_move? returns false if move is not diagonal' do
      result = piece.diagonal_move?(1, 3, 2, 3)
      expect(result).to eq false
    end

    it '#in_bounds? returns true if the move is within bounds' do
      result = piece.in_bounds?(4, 7)
      expect(result).to eq true
    end

    it '#in_bounds? returns false if the move is not within bounds' do
      result = piece.in_bounds?(2, 9)
      expect(result).to eq false
    end

    it '#valid_move? returns true if the move is valid' do
      result = piece.valid_move?(1, 1, 2, 3)
      expect(result).to eq true
    end

    it '#valid_move? returns false if the move is not valid' do
      result = piece.valid_move?(1, 2, 9, 10)
      expect(result).to eq false
    end

    xit '#is_obstructed? returns true if the move is obstructed' do
      result = piece.is_obstructed?(2, 3, 1, 1)
      expect(result).to eq true
    end

    xit '#is_obstructed? returns false if the move is not obstructed' do
    end
  end
end
