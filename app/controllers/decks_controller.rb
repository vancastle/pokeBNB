class DecksController < ApplicationController
  before_action :set_deck, only: :show
  before_action :set_user, only: %i[index new create]

  def index
    @decks = Deck.all
    @decks = search_decks(@decks) if params[:query].present?
    @decks = filter_decks(@decks)
  end

  def show
    @booking = Booking.new
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

  def deck_params
    params.require(:deck).permit(:name)
  end

  def filter_decks(decks)
    decks.reject { |deck| deck.user.username == @user.username }
  end

  def search_decks(decks)
    sql_subquery = <<~SQL
      decks.title @@ :query
      OR decks.description @@ :query
      OR cards.name @@ :query
    SQL
    decks.joins(:cards).where(sql_subquery, query: "%#{params[:query]}%").distinct
  end

  def set_deck
    @deck = Deck.find(params[:id])
  end

  def set_user
    @user = current_user
  end
end
