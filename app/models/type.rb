class Type < ApplicationRecord
  has_and_belongs_to_many :pokemons, join_table: "pokemon_types"
  has_many :moves_types
  has_many :moves, through: :moves_types


  validates :name, presence: true, uniqueness: true

   # Method to find weaknesses based on type
   def weaknesses
    type_weaknesses = {
      "Fire" => [ "Water", "Rock", "Ground" ],
      "Water" => [ "Electric", "Grass" ],
      "Electric" => [ "Ground" ],
      "Grass" => [ "Fire", "Ice", "Poison", "Flying", "Bug" ],
      "Ice" => [ "Fire", "Fighting", "Rock", "Steel" ],
      "Fighting" => [ "Flying", "Psychic", "Fairy" ],
      "Psychic" => [ "Bug", "Ghost", "Dark" ],
      "Bug" => [ "Fire", "Flying", "Rock" ],
      "Ghost" => [ "Ghost", "Dark" ],
      "Dark" => [ "Fighting", "Bug", "Fairy" ],
      "Fairy" => [ "Fire", "Poison", "Steel" ],
      "Poison" => [ "Ground", "Psychic" ],
      "Flying" => [ "Electric", "Ice", "Rock" ],
      "Rock" => [ "Water", "Grass", "Fighting", "Ground", "Steel" ],
      "Ground" => [ "Water", "Ice", "Grass", "Flying" ],
      "Steel" => [ "Fire", "Fighting", "Ground" ],
      "Dragon" => [ "Ice", "Dragon", "Fairy" ],
      "Normal" => [ "Fighting" ]
    }

    type_weaknesses[self.name] || []  # Return weaknesses for this type
  end
end
