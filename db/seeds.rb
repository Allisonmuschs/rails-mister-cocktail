# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
puts "destroying ingredients"
Ingredient.destroy_all
puts "ingredients destroyed!"
url = 'https://www.thecocktaildb.com/api/json/v1/1/list.php?i=list'
ingredients_drinks = JSON.parse(open(url).read)
ingredients = ingredients_drinks['drinks']
ingredients.each do |ingredient|
  i = Ingredient.create(name: ingredient['strIngredient1'])
  puts i
end
