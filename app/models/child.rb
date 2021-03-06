class Child < ApplicationRecord
  belongs_to :mother
  has_many :chatrooms, dependent: :destroy
  has_many :milestones, dependent: :destroy
  
  mount_uploader :avatar, AvatarUploader


  def age
    age = ""
    year = ((Date.today - self.birthday)/365).to_f.to_int.to_s 
    month = ((Date.today - self.birthday)/30).to_f.to_int.to_s
      
    age = "#{year} years #{month} months old"
  end




end
