class Type < ApplicationRecord
  has_and_belongs_to_many :pokemons
  has_many :moves_types
  has_many :moves, through: :moves_types

  validates :name, presence: true, uniqueness: true
end
