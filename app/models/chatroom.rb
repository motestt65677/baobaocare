class Chatroom < ApplicationRecord
  has_many :comments
  belongs_to :doctor
  belongs_to :child
  has_many :reservations
end
