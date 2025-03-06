class Move < ApplicationRecord
  has_many :moves_types
  has_many :types, through: :moves_types
  has_and_belongs_to_many :pokemons

  validates :name, presence: true, uniqueness: true
  validates :accuracy, :power, :pp, numericality: { only_integer: true, greater_than_or_equal_to: 0}
  validates :category, presence: true
  validates :move_type, presence: true
end
