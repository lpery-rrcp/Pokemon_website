require 'json'

Pokemon.destroy_all
Move.destroy_all
Item.destroy_all
Type.destroy_all

def load_json(file)
  file_path = Rails.root.join('db', 'pokemon_json', file)
  JSON.parse(File.read(file_path))
end

# Seed Pokémon
def seed_pokemon
  pokedex_data = load_json('pokedex.json')
  pokedex_data.each do |p|
    Pokemon.find_or_create_by(pokedex_id: p['id']) do |pokemon|
      pokemon.name = p['name']['english']
      pokemon.type = Array(p['type']).join(', ')
      pokemon.base_hp = p['base']['HP']
      pokemon.base_attack = p['base']['Attack']
      pokemon.base_defense = p['base']['Defense']
      pokemon.base_sp_attack = p['base']['Sp. Attack']
      pokemon.base_sp_defense = p['base']['Sp. Defense']
      pokemon.base_speed = p['base']['Speed']
    end
  end
  puts "Pokemon: #{Pokemon.count}"
end

# Seed Moves
def seed_moves
  move_data = load_json('moves.json')
  move_data.each do |m|
    Move.find_or_create_by(name: m['ename']) do |move|
      move.accuracy = m['accuracy']
      move.power = m['power']
      move.pp = m['pp']
      move.category = m['category']
      move.move_type = m['type']
    end
  end
  puts "Moves: #{Move.count}"
end

# Seed Items
def seed_items
  item_data = load_json('items.json')
  item_data.each do |i|
    item_name = i['name']['english'].strip.downcase
    Item.find_or_create_by(name: item_name) do |item|
      item_name = i ['name']['english']
    end
  end
  puts "Items: #{Item.count}"
end

def seed_types
  type_data = load_json('types.json')
  type_data.each do |t|
    Type.find_or_create_by(name: t['english'].strip.downcase) do |type|
      type.name = t['english']
    end
  end
  puts "Types: #{Type.count}"
end

puts 'Seeding database...'
seed_pokemon
seed_moves
seed_items
seed_types
puts 'Seeding complete!'