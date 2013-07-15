# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

User.where(email: 'admin@eardrums.in').first.try(:delete)
User.create! do |r|
  r.first_name  = "Admin"
  r.email       = 'admin@eardrums.in'
  r.password    = 'password'
  r.role        = 'admin'
end
    
Discipline.delete_all
disciplines = Discipline.create([{name: 'Guitar', description: 'Guitar'}, 
                                 {name: 'Hindustani', description: 'Hindustani'},
                                 {name: 'Keyboard', description: 'Keyboard'},
                                 {name: 'Carnatic', description: 'Carnatic'}])

Level.delete_all                                 
levels = Level.create([{name: 'Early Elementary', description: 'Early Elementary'}, 
              {name: 'Elementary', description: 'Elementary'}, 
              {name: 'Beginner', description: 'Beginner'}, 
              {name: 'Early Intermediate', description: 'Early Intermediate'}, 
              {name: 'Intermediate', description: 'Intermediate'}, 
              {name: 'Amateur', description: 'Amateur'}, 
              {name: 'Early Advanced', description: 'Early Advanced'}, 
              {name: 'Advanced', description: 'Advanced'}, 
              {name: 'Advanced +', description: 'Advanced +'},
              {name: 'Professional', description: 'Professional'}])

Course.delete_all
courses = Course.create([{name: "Beginner - Carnatic", description: "Beginner - Carnatic", duration: 8, price: "1500", status: "Active", level: levels[2], discipline: disciplines[3]},
               {name: "Beginner - Guitar", description: "Beginner - Guitar", duration: 8, price: "1500", status: "Active", level: levels[2], discipline: disciplines.first},
               {name: "Beginner - Keyboard", description: "Beginner - Keyboard", duration: 8, price: "1500", status: "Active", level: levels[2], discipline: disciplines[2]}])
