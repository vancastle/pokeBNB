class DecksController < ApplicationController
  before_action :set_deck, only: :show
  before_action :set_user, only: %i[new create]

  def index
    @decks = Deck.all
  end

  def show
  end

  def new
    @deck = Deck.new
  end

  def create
    @deck = Deck.new(deck_params)
    @deck.user = @user

    if @deck.save
      redirect_to deck_path(@deck)
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def set_user
    @user = current_user
  end

  def set_deck
    @deck = Deck.find(params[:id])
  end

  def deck_params
    params.require(:deck).permit(:name)
  end
end
