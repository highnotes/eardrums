# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

disciplines = Discipline.create([{name: 'Guitar', description: 'Guitar'}, 
                                 {name: 'Hindustani', description: 'Hindustani'},
                                 {name: 'Keyboard', description: 'Keyboard'},
                                 {name: 'Carnatic', description: 'Carnatic'}])
                                 
levels = Level.create([{name: 'Early Elementary', description: 'Early Elementary'}, 
              {name: 'Elementary', description: 'Elementary'}, 
              {name: 'Beginner', description: 'Beginner'}, 
              {name: 'Early Intermediate', description: 'Early Intermediate'}, 
              {name: 'Intermediate', description: 'Intermediate'}, 
              {name: 'Amateur', description: 'Amateur'}, 
              {name: 'Early Advanced', description: 'Early Advanced'}, 
              {name: 'Advanced', description: 'Advanced'}, 
              {name: 'Advanced +', description: 'Advanced +'}, 
              {name: 'Professional', description: 'Professional'},#10
              {name: 'Early Elementary', description: 'Early Elementary'}, 
              {name: 'Elementary', description: 'Elementary'}, 
              {name: 'Beginner', description: 'Beginner'}, 
              {name: 'Early Intermediate', description: 'Early Intermediate'}, 
              {name: 'Intermediate', description: 'Intermediate'}, 
              {name: 'Amateur', description: 'Amateur'}, 
              {name: 'Early Advanced', description: 'Early Advanced'}, 
              {name: 'Advanced', description: 'Advanced'}, 
              {name: 'Advanced +', description: 'Advanced +'}, 
              {name: 'Professional', description: 'Professional'},#20
              {name: 'Early Elementary', description: 'Early Elementary'}, 
              {name: 'Elementary', description: 'Elementary'}, 
              {name: 'Beginner', description: 'Beginner'}, 
              {name: 'Early Intermediate', description: 'Early Intermediate'}, 
              {name: 'Intermediate', description: 'Intermediate'}, 
              {name: 'Amateur', description: 'Amateur'}, 
              {name: 'Early Advanced', description: 'Early Advanced'}, 
              {name: 'Advanced', description: 'Advanced'}, 
              {name: 'Advanced +', description: 'Advanced +'}, 
              {name: 'Professional', description: 'Professional'}])

courses = Course.create([{name: "Beginner - Carnatic", description: "Beginner - Carnatic", duration: 8, price: "1500", status: "Active", level: levels[2], discipline: disciplines[3]},
               {name: "Beginner - Guitar", description: "Beginner - Guitar", duration: 8, price: "1500", status: "Active", level: levels[2], discipline: disciplines.first},
               {name: "Beginner - Keyboard", description: "Beginner - Keyboard", duration: 8, price: "1500", status: "Active", level: levels[2], discipline: disciplines[2]}])
