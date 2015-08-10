class Game < ActiveRecord::Base
  ROUNDS_COUNT = 6

  has_many :rounds, inverse_of: :game

  validates :rounds, length: { is: ROUNDS_COUNT }
end
