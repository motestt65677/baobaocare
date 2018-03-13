class Child < ApplicationRecord
  belongs_to :mother
  has_many :chatrooms
end
