# encoding: UTF-8
# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

User.destroy_all

User.create!([{ username: "admin", email: "hey@giammattey.com", is_admin: true, password: "admin123", password_confirmation: "admin123" }, { username: "Uliving", email: "cm@uliving.com", is_admin: true, password: "12345", password_confirmation: "12345" }, { username: "giamma", email: "giammattey@gmail.com", is_admin: true, password: "12345", password_confirmation: "12345", studio_number: "301", phone_number: "5521975575574" }, { username: "fulano", email: "fulano@uliving.com", is_admin: false, password: "12345", password_confirmation: "12345", studio_number: "236" }, { username: "beltrano", email: "beltrano@uliving.com", is_admin: false, password: "12345", password_confirmation: "12345", studio_number: "336" }, { username: "cicrano", email: "cicrano@uliving.com", is_admin: false, password: "12345", password_confirmation: "12345", studio_number: "436" }]) if Rails.env.development?
