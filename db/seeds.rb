# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

User.create(email: 'bob', password: 'test', profile_image_url: 'http://www.britishbattles.com/wp-content/uploads/2017/02/montague-dawson-the-battle-of-trafalgar_.jpg')

User.create(email: 'jim', password: 'test', profile_image_url: 'http://www.britishbattles.com/wp-content/uploads/2017/02/montague-dawson-the-battle-of-trafalgar_.jpg')

User.create(email: 'w', password: 'test', profile_image_url: "")

Record.create(name: 'test.js', language: 'javascript', content: 'First file! It\'s awesome')

Record.create(name: 'test.rb', language: 'ruby', content: 'Second file! It\'s also awesome')

RecordsUser.create(user_id: 1, record_id: 1)
RecordsUser.create(user_id: 1, record_id: 2)
RecordsUser.create(user_id: 2, record_id: 2)
