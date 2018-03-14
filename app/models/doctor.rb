class Doctor < User
  has_many :chatrooms
  
  def name
  	[first_name, last_name].join(',')
  end
end
