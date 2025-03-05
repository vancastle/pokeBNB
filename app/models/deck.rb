class Deck < ApplicationRecord
  belongs_to :user

  has_many :bookings
  has_many :users, through: :bookings
  has_many :deck_cards
  has_many :cards, through: :deck_cards

  has_one_attached :photo

  validates :title, presence: true, uniqueness: true
end
