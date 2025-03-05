class Card < ApplicationRecord
  has_one_attached :photo

  has_many :deckCards
  has_many :decks, through: :deckCards

  validates :name, presence: true
end
