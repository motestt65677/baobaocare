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




#   child['user_id'] = mother_ids.sample

#   child1 = Child.create(child)
#   p child1.errors
# end


# child_ids = (1..11).to_a

chatroom = {}
user_ids = [1, 2, 3, 4, 5, 6, 7, 8, 9]
child_ids = [1, 2, 3, 4, 5, 6, 7, 8, 9]

10.times do |num|
  chatroom['user_id'] = user_ids.sample
  chatroom['child_id'] = child_ids.sample
  chatroom1 = Chatroom.create(chatroom)
  p chatroom1.errors
end