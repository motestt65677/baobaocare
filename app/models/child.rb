class Child < ApplicationRecord
  belongs_to :mother
  has_many :chatrooms
  
  mount_uploader :avatar, AvatarUploader
end
