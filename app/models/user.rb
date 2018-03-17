class User < ApplicationRecord
  include Clearance::User
  has_many :comments, dependent: :destroy
  has_many :children, dependent: :destroy
  max_paginates_per 5
	paginates_per 5
  
  validates :first_name, presence: true
  validates :last_name, presence: true
  
  mount_uploader :avatar, AvatarUploader
end
