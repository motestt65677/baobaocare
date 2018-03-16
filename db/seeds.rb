# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'faker'


# user = {}
# user['password'] = 'asdf'
# user['confirmation_token'] = 'asdf'

# 1.times do |num| 
#     user['first_name'] = Faker::Name.first_name 
#     user['last_name'] = Faker::Name.last_name  
#     user['email'] = Faker::Internet.email
#     Doctor.create(user)
# end


doctor = {}
specialties= ["pediatrician","nutritionist","psychologist","nutritionist"]
years= [1,2,3,4,5,6]



24.times do |num|
  doctor['first_name'] = Faker::Name.first_name
  doctor['last_name'] = Faker::Name.last_name  
  doctor['email'] = Faker::Internet.email
  doctor['password'] =Faker::Internet.password
  doctor['specialty']= specialties.sample
  doctor ['experience_years'] = years.sample
  doctor ['location'] =Faker::Address.city

  doctor1 = Doctor.create(doctor)
  p doctor1.errors

end


# mother ={}

# 5.times do |num|
#   mother['first_name'] = Faker::Name.first_name
#   mother['last_name'] = Faker::Name.last_name  
#   mother['email'] = Faker::Internet.email
#   mother['password'] =Faker::Internet.password



#   mother1 = Mother.create(mother)
#   p mother1.errors

# end


# child ={}
# mother_ids = (37..42).to_a

# child_ids = (22..31).to_a
# 5.times do |num|
#   child['name'] = Faker::Name.name
#   child['birthday'] = Faker::Date.birthday



#   child['mother_id'] = mother_ids.sample

#   child1 = Child.create(child)
#   p child1.errors
# end




# chatroom = {}
# doctor_ids = [16,17]
# child_ids = [3, 4, 5]

# 10.times do |num|
#   chatroom['doctor_id'] = doctor_ids.sample
#   chatroom['child_id'] = child_ids.sample
#   chatroom1 = Chatroom.create(chatroom)
#   p chatroom1.errors
# end