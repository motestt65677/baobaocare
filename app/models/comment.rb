class Comment < ApplicationRecord
  belongs_to :mother, class_name: "User"
  belongs_to :doctor, class_name: "User"

end
