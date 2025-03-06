class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: :home

  def home
    decks = Deck.all.sample(50)
    shuffled_decks = decks.shuffle

    @decks1 = shuffled_decks.first(3)
    @decks2 = shuffled_decks.last(3)
  end
end
