# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
User.create(username: "Superadmin", email: 'admin@lib.com', role: "admin", password: "admin", password_confirmation: "admin")
LibraryRoom.create(number: 200, building: 'Hunt', size: 2)
LibraryRoom.create(number: 300, building: 'Hunt', size: 4)
LibraryRoom.create(number: 400, building: 'Hunt', size: 6)
LibraryRoom.create(number: 250, building: 'DH Hill', size: 2)
LibraryRoom.create(number: 350, building: 'DH Hill', size: 4)
LibraryRoom.create(number: 450, building: 'DH Hill', size: 6)