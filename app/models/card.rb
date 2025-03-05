class Card < ApplicationRecord
  has_one_attached :photo

  has_many :deck_cards
  has_many :decks, through: :deck_cards

  validates :name, presence: true
end
