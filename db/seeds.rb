# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

User.create(email: "hey@giammattey.com", username: "admin", is_admin: true, password: "12345", password_confirmation: "12345").save

Page.create(title: "Home", body: "Welcome to Uliving Rio's Bulletin Board", url: "home").save

Page.create(title: "About", body: "This is Uliving Rio's Bulletin Board", url: "about").save
