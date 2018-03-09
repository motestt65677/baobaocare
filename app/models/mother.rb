class Mother < User
  has_many :comments, :foreign_key => :comment_id

end
