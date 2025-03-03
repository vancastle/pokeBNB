class DecksController < ApplicationController
  before_action :set_deck, only: %i[show]

  def index
    @decks = Deck.all
  end

  def show; end

  def new
    @deck = Deck.new
  end

  def create
    @deck = Deck.new(deck_params)
    @deck.save!
    if @review.save
      redirect_to deck_path(@deck)
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def set_deck
    @deck = Deck.find(params[:id])
  end

  def deck_params
    params.require(:deck).permit(:name)
  end
end
