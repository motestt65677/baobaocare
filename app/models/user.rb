class User < ApplicationRecord
  include Clearance::User
  has_many :comments
  has_many :children
  max_paginates_per 5
	paginates_per 5
  
  validates :first_name, presence: true
  validates :last_name, presence: true
end
