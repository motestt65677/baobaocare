class Child < ApplicationRecord
  belongs_to :mother
  has_many :chatrooms


  def age
    age = ((Date.today - self.birthday)/365).to_f.to_int
  end

end
