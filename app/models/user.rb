class User < ApplicationRecord
  include Clearance::User
  has_many :comments
  has_many :children
  
end
