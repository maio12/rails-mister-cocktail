# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
# require "faker"

# puts 'Creating 30 ingredients'
# 30.times do
#   ingredient = Ingredient.create(name: Faker::Food.ingredient)

#   ingredient.save!
# end

# puts "Finished!"

require 'json'
require 'open-uri'

# Ingredient.delete_all

url = 'https://www.thecocktaildb.com/api/json/v1/1/list.php?i=list'
user_serialized = open(url).read
cocktail_hash = JSON.parse(user_serialized)

cocktail_hash["drinks"].each do |el|
  Ingredient.create(name: el['strIngredient1'])
end
