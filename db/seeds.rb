# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
User.create(email: "sergii@email.com", password: "password", first_name: "Sergii", last_name: "Cherevko", age: "32", height: "6", weight: "165", picture_url: "")
User.create(email: "jabi@email.com", password: "password", first_name: "Jabi", last_name: "Hernandez", age: "32", height: "6", weight: "160", picture_url: "")
User.create(email: "ahsan@email.com", password: "password", first_name: "Ahsan", last_name: "WhateverAhsanLastName", age: "15", height: "6", weight: "180", picture_url: "")

#name players req indoor

Sport.create(image_url: "img/t_tennis.jpeg", name: "Table Tenis", players_req: 2, indoor: true)
Sport.create(image_url: "img/rock_climbing.jpg", name: "Rock climbing", players_req: 2, indoor: true)
Sport.create(image_url: "img/jiu_jitsu.png", name: "Jiu Jitsu", players_req: 2, indoor: true)
Sport.create(image_url: "", name: "5 on 5 Basketball", players_req: 10, indoor: false)


UserSport.create(sport_level: "10", summary: "Self taught, but have been playing for 5 year and feel that I can compet with advanced players", user_id: 1, sport_id: 1)
UserSport.create(sport_level: "3", summary: "Just looking for someone who can belay me and I will belay you.", user_id: 2, sport_id: 2)
UserSport.create(sport_level: "4", summary: "I've been in Jiu Jitsu for 10 year, looking for very experienced opponents.", user_id: 3, sport_id: 3)



Event.create(user_id: 1, address: "140 S Clark St #180, Chicago, IL 60603", name: "Table Tenis", sport_id: 1, description: "Self taught, but have been playing for 5 year and feel that I can compet with advanced players", available_datetime: "2018-04-10")
Event.create(user_id: 1, address: "337 E Randolph Service St, Chicago, IL 60601", name: "Rock climbing", sport_id: 2, description: "I played this sport at college and I'm decent.", available_datetime: "2018-04-11")
Event.create(user_id: 1, address: "820 N Orleans St, Chicago, IL 60610", name: "Jiu jitsu", sport_id: 3, description: "I've been in Jiu Jitsu for 10 year, looking for very experienced opponents.", available_datetime: "2018-04-12")


Request.create(event_id: 1, user_id: 2, message: "I played this sport in college for 3 years. Looking for someone who really pationed about this sport", accepted: true)
Request.create(event_id: 2, user_id: 3, message: "Let's do it! I like to do it for fun.", accepted: true)
Request.create(event_id: 3, user_id: 2, message: "I've practiced Jiu Jitsu for 6 years. Would you like to sparring?", accepted: false)
