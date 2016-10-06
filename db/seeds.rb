# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
User.create(username: "Superadmin", email: 'admin@lib.com', role: "admin", password: "admin", password_confirmation: "admin")
User.create(username: "admin", email: 'admins@lib.com', role: "admin", password: "admins", password_confirmation: "admins")
User.create(username: "libadmin", email: 'libadmin@lib.com', role: "admin", password: "libadmin", password_confirmation: "libadmin")
User.create(username: "libuser", email: 'libuser@lib.com', role: "user", password: "libuser", password_confirmation: "libuser")
LibraryRoom.create(number: 200, building: 'Hunt', size: 2, id: 200)
LibraryRoom.create(number: 300, building: 'Hunt', size: 4, id: 300)
LibraryRoom.create(number: 400, building: 'Hunt', size: 6, id: 400)
LibraryRoom.create(number: 250, building: 'DH Hill', size: 2, id: 250)
LibraryRoom.create(number: 350, building: 'DH Hill', size: 4, id: 350)
LibraryRoom.create(number: 450, building: 'DH Hill', size: 6, id: 450)