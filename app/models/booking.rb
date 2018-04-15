class Booking < ApplicationRecord
  belongs_to :profile
  belongs_to :deal

  validates :start_date, presence: true
  validates :nb_people, presence: true
  
  monetize :price_cents
end
