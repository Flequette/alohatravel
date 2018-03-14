class Booking < ApplicationRecord
  belongs_to :profile
  belongs_to :deal

  validates :start_date, presence: true
  validates :end_date, presence: true
  validates :status, presence: true
  validates :message, presence: true, length: { maximum:300 }

end
