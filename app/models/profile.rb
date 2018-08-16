class Profile < ApplicationRecord
  belongs_to :user
  has_many :deals, dependent: :destroy
  has_many :bookings, dependent: :destroy

  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :age, presence: true
  validates :phone_number, presence: true
  validates :country, presence: true
  validates :city, presence: true
  validates :language, presence: true
  validates :description, presence: true
  validates :why_guide, presence: true

  mount_uploader :photo, PhotoUploader
end
