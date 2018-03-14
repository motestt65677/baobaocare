class Doctor < User
  has_many :chatrooms
  max_paginates_per 5
	paginates_per 5
	
  def name
  	[first_name, last_name].join(',')
  end
end
