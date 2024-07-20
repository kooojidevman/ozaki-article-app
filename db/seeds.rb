# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

# db/seeds.rb

# Creating sample todos
Todo.create([
              { title: 'Learn Ruby on Rails', is_done: false, created_at: Time.now, updated_at: Time.now },
              { title: 'Build a todo list app', is_done: false, created_at: Time.now, updated_at: Time.now },
              { title: 'Deploy the app to Heroku', is_done: false, created_at: Time.now, updated_at: Time.now },
              { title: 'Write tests for the app', is_done: false, created_at: Time.now, updated_at: Time.now },
              { title: 'Refactor code', is_done: false, created_at: Time.now, updated_at: Time.now },
              { title: 'Update documentation', is_done: false, created_at: Time.now, updated_at: Time.now },
              { title: 'Learn new Rails features', is_done: false, created_at: Time.now, updated_at: Time.now },
              { title: 'Clean up the database', is_done: false, created_at: Time.now, updated_at: Time.now },
              { title: 'Optimize app performance', is_done: false, created_at: Time.now, updated_at: Time.now },
              { title: 'Prepare for presentation', is_done: false, created_at: Time.now, updated_at: Time.now }
            ])
