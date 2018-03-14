class Profile < ApplicationRecord
  belongs_to :user
  has_many :deals, dependent: :destroy
  has_many :bookings, dependent: :destroy

  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :age, presence: true
  validates :location, presence: true
  validates :phone_number, presence: true
  validates :photo, presence: true
  mount_uploader :photo, PhotoUploader
end
