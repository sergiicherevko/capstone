# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
User.create(email: "sergii@email.com", password: "password", first_name: "Sergii", last_name: "Cherevko", age: "32", height: "6", weight: "165", picture_url: "")
User.create(email: "vince@email.com", password: "password", first_name: "Vince", last_name: "WhateverVinceLastName", age: "32", height: "6", weight: "160", picture_url: "")
User.create(email: "ahsan@email.com", password: "password", first_name: "Ahsan", last_name: "WhateverAhsanLastName", age: "15", height: "6", weight: "180", picture_url: "")

#name players req indoor

Sport.create(image_url: "img/t_tennis.jpeg", name: "Table Tenis", players_req: 2, indoor: true)
Sport.create(image_url: "img/rock_climbing.jpg", name: "Rock climbing", players_req: 2, indoor: true)
Sport.create(image_url: "img/jiu_jitsu.png", name: "Jiu Jitsu", players_req: 2, indoor: true)
Sport.create(image_url: "", name: "5 on 5 Basketball", players_req: 10, indoor: false)


UserSport.create(sport_level: "10", summary: "Try me", user_id: 1, sport_id: 1)
UserSport.create(sport_level: "3", summary: "I'm learning", user_id: 2, sport_id: 1)
UserSport.create(sport_level: "4", summary: "I'm ok, by Sergii is the best", user_id: 3, sport_id: 1)
UserSport.create(sport_level: "5", summary: "I'd like to learn from Sergii", user_id: 1, sport_id: 2)
UserSport.create(sport_level: "4", summary: "I'm a beginer", user_id: 1, sport_id: 3)



Event.create(user_id: 1, name: "Table Tenis", sport_id: 1, description: "Lets go play some t tenis", available_datetime: "2018-04-10")
Event.create(user_id: 1, name: "Rock climbing", sport_id: 2, description: "Let go rock it!", available_datetime: "2018-04-11")
Event.create(user_id: 1, name: "Jiu jitsu", sport_id: 3, description: "Lets do it", available_datetime: "2018-04-12")
Event.create(user_id: 2, name: "Table Tenis", sport_id: 1, description: "I'd like someone to teach me", available_datetime: "2018-04-10")
Event.create(user_id: 3, name: "Table Tenis", sport_id: 1, description: "I'm really bad at this sport :(", available_datetime: "2018-04-10")


Request.create(event_id: 1, user_id: 2, message: "I'd like to learn from you", accepted: true)
Request.create(event_id: 1, user_id: 3, message: "I'm not good at this sport, I'd like to learn from a pro", accepted: true)
Request.create(event_id: 2, user_id: 2, message: "I'd be able to play this day, let do it!", accepted: false)
Request.create(event_id: 1, user_id: 3, message: "Hey, I'd like to join you if you don't mind", accepted: false)
Request.create(event_id: 3, user_id: 2, message: "Can I please please play with", accepted: true)