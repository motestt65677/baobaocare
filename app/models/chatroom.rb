class Chatroom < ApplicationRecord
  has_many :comments
  belongs_to :doctors
  belongs_to :children
end
