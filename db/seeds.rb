# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'open-uri'
require 'json'

url = "http://www.thecocktaildb.com/api/json/v1/1/list.php?i=list"
file = open(url).read
document = JSON.parse(file)["drinks"]
document.each do |ingredient|
  Ingredient.create(name: ingredient["strIngredient1"])
end


Cocktail.create(name: "Cuba Libre")
Dose.create(description: "6", cocktail_id: 1, ingredient_id: 1)
Dose.create(description: "4", cocktail_id: 1, ingredient_id: 2)
Dose.create(description: "3", cocktail_id: 1, ingredient_id: 3)
