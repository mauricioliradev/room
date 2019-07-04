# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

puts '##### USERS'
user_01 = User.create!(
  email: 'admin@email.com',
  password: '123456789',
  name: 'Administrador do Sistema'    
)

user_02 = User.create!(
  email: 'flash@email.com',
  password: '123456789',
  name:'Barry Allen'   
)

user_03 = User.create!(
  email: 'wonderwoman@email.com',
  password: '123456789',
  name:'Diana: Mulher Maravilha' 
)

user_04 = User.create!(
  email: 'superman@email.com',
  password: '123456789',
  name: 'Clark Kent'
)
event_01 =  Event.create!(
  user_id: 2,
  description: Faker::Book.title,
  start: "2019-06-25 12:00:00 -0300".to_time,
  end: "2019-06-25 12:30:00 -0300".to_time,
  color: ['black','green','red', nil].sample
  )

event_02 =  Event.create!(
  user_id: 3,
  description: Faker::Book.title,
  start: "2019-06-26 14:00:00 -0300".to_time,
  end: "2019-06-26 14:30:00 -0300".to_time,
  color: ['black','green','red', nil].sample
)

event_03 =  Event.create!(
  user_id: 1,
  description: Faker::Book.title,
  start: "2019-06-27 16:00:00 -0300".to_time,
  end: "2019-06-27 16:30:00 -0300".to_time,
  color: ['black','green','red', nil].sample
)