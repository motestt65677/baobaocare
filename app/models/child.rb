class Child < ApplicationRecord
  belongs_to :mother
  has_many :chatrooms, dependent: :destroy
  has_many :milestones, dependent: :destroy
  
  mount_uploader :avatar, AvatarUploader


  def age
    age = ((Date.today - self.birthday)/365).to_f.to_int
  end




end
