class User < ApplicationRecord
  include Clearance::User
  has_many :comments
  has_many :children
  
  validates :first_name, presence: true
  validates :last_name, presence: true
  
  mount_uploader :avatar, AvatarUploader
end
