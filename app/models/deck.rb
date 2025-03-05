class Deck < ApplicationRecord
  belongs_to :user

  has_many :bookings
  has_many :users, through: :bookings
  has_many :deckCards
  has_many :cards, through: :deckCards

  has_one_attached :photo

  validates :title, presence: true, uniqueness: true
end
