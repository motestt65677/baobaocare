class Child < ApplicationRecord
  belongs_to :mother
  has_many :chatrooms
  has_many :milestones
end
