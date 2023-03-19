# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

categories = Category.create([
    {name: "Cat2", user_id: 1},
    {name: "Cat3", user_id: 1},
    {name: "Cat4", user_id: 1}
])

Task.create([
    {title: "Title 1 of Cat1", category_id: 1, status: "pending"},
    {title: "Title 2 of Cat1", category_id: 1, status: "pending"},
    {title: "Title 3 of Cat1", category_id: 1, status: "pending"},
    {title: "Title 4 of Cat2", category_id: 2, status: "pending"},
    {title: "Title 5 of Cat2", category_id: 2, status: "pending"},
    {title: "Title 6 of Cat3", category_id: 3, status: "pending"},
    {title: "Title 6 of Cat3", category_id: 4, status: "pending"},
    {title: "Title 6 of Cat3", category_id: 4, status: "pending"},
    {title: "Title 6 of Cat3", category_id: 4, status: "pending"},
    {title: "Title 6 of Cat3", category_id: 4, status: "pending"}
])