class Deal < ApplicationRecord
  validates :name, presence: true
  validates :description, presence: true
  validates :location, presence: true
  validates :photo, presence: true
  validates :price, presence: true, numericality: { only_integer: true }

end
