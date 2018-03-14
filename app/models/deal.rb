class Deal < ApplicationRecord
  belongs_to :profile
  has_many :profiles, through: :bookings
  has_many :bookings, dependent: :destroy

  validates :name, presence: true
  validates :description, presence: true, length: { maximum:2500 }
  validates :location, presence: true
  validates :photo, presence: true
  validates :price, presence: true, numericality: { only_integer: true }
  validates :photo, presence: true
  mount_uploader :photo, PhotoUploader

end
