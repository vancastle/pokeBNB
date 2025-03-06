class PagesController < ApplicationController
  def home
    @decks = Deck.first(3)
  end
end
