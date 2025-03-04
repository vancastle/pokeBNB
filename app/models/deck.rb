class Deck < ApplicationRecord
  belongs_to :user

  has_many :bookings
  has_many :users, through: :bookings

  has_many_attached :photos

  validates :name, presence: true, uniqueness: true
end
