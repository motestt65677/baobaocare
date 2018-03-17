class Chatroom < ApplicationRecord
  has_many :comments, dependent: :destroy
  belongs_to :doctor
  belongs_to :child
  has_many :reservations, dependent: :destroy
end
