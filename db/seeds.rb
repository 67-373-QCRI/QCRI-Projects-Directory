# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

User.create(username: "ykhanfar", email: "ykhanfar@andrew.cmu.edu", password: "admin123", password_confirmation: "admin123", admin: true)
User.create(username: "ajones", email: "alexjones@gmail.com", password: "notadmin", password_confirmation: "notadmin")

Researcher.create(user_id: 1, first_name: "Yousef", last_name: "Khanfar", group: "Computational Biology", job_title: "Software Developer", phone_number: "3375 7580", office_location: "Hall A, Room 203", github_url: "https://github.com/ykhanfar", is_leader: true)
Researcher.create(user_id: 2, first_name: "Alex", last_name: "Jones", is_leader: true)
