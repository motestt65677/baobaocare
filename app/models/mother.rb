class Mother < User
  has_many :children

  def name
  	[first_name, last_name].join(',')
  end
end
