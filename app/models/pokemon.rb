class Pokemon < ApplicationRecord
  has_and_belongs_to_many :types
  has_many :moves_types
  has_many :moves, through: :moves_types

  validates :name, presence: true, uniqueness: true
  validates :pokedex_id, presence: true, numericality: { only_integer: true }, uniqueness: true
  validates :base_hp, :base_attack, :base_defense,
            :base_sp_attack, :base_sp_defense, :base_speed,
            numericality: { only_integer: true, greater_than_or_equal_to: 0 }
  validates :type, presence: true

  self.inheritance_column = nil
end
