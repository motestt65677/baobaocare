class Doctor < User
  has_many :chatrooms
  
  def name
  	[first_name, last_name].join(',')
  end

   scope :speciality, -> (speciality) { where("specialty ILIKE ?", "%#{speciality}%") }

   scope :location, -> (location) { where("location ILIKE ?", "%#{location}%") }   
  

end
