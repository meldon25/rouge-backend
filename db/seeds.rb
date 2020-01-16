# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first) 

mel = User.create([
    {username: 'Melissa', password:'123456'}
])

Product.create([
  
    {image: 'https://i.imgur.com/vSWkGfe.jpg', product: 'Blazer Set', color: 'Red', price: '$325'},
    {image: 'https://i.imgur.com/caP77IP.jpg', product: 'White Puffer', color: 'White', price: '$450'},
    {image: 'https://i.imgur.com/LsEME4I.jpg', product: 'Blazer', color: 'Orange', price: '$125'},
    {image: 'https://i.imgur.com/ZpPtWpT.jpg', product: 'Silk Camisole', color: 'Rose', price: '$75'},
    {image: 'https://i.imgur.com/knRBAGQ.jpg', product: 'Blazer', color: 'Red', price: '$125'},
    {image: 'https://i.imgur.com/jHHuT3r.jpg', product: 'Faux Fur Coat', color: 'Blush', price: '$450'},
    {image: 'https://i.imgur.com/4BxOy1B.jpg', product: 'Mesh & Blazer combo', color: 'Red/Black', price: '$250'}
])

edna = Product.create([{image: 'https://i.imgur.com/o3BDTlQ.jpg', product: 'Striped Olive Blouse', color: 'Olive/Red/Black', price: '$215'}]),

Wishlist.create([{user_id:1, product_id:1}])

puts 'seeded database'
