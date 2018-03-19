class Mother < User
  has_many :children, dependent: :destroy

  def name
  	[first_name, last_name].join(',')
  end
end
