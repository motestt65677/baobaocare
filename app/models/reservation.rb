class Reservation < ApplicationRecord
    belongs_to :chatroom
    validates :start_date, presence: true
    validates :end_date, presence: true
    validates :start_time, presence: true
    validates :end_time, presence: true
end
