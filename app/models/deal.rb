class Deal < ApplicationRecord
  belongs_to :profile
  has_many :profiles, through: :bookings
  has_many :bookings, dependent: :destroy

  validates :name, presence: true
  validates :description, presence: true, length: { maximum:2500 }
  validates :price, numericality: { only_integer: true }
  validates :address, presence: true
  validates :city, presence: true
  validates :zip_code, presence: true
  validates :inhabitant, presence: true
  validates :activity_type, presence: true
  validates :time, presence: true
  mount_uploader :photo, PhotoUploader

end
