class DecksController < ApplicationController
  before_action :set_deck, only: :show
  skip_before_action :authenticate_user!, only: %i[index show]

  # See others decks
  def index
    @decks = Deck.all
    @decks = search_decks(@decks) if params[:query].present?
    @decks = others_decks(@decks) unless current_user.nil?
  end

  def show
    @booking = Booking.new
  end

  # See self decks
  def my_decks
    @decks = Deck.all
    @decks = self_decks(@decks)
  end

  def new
    @deck = Deck.new
  end

  def create
    @deck = Deck.new(deck_params)
    @deck.user = current_user

    if @deck.save
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

  def self_decks(decks)
    decks.select { |deck| deck.user.username == current_user.username }
  end

  def others_decks(decks)
    decks.reject { |deck| deck.user.username == current_user.username }
  end

  def search_decks(decks)
    sql_subquery = <<~SQL
      decks.title @@ :query
      OR decks.description @@ :query
      OR cards.name @@ :query
    SQL
    decks.joins(:cards).where(sql_subquery, query: "%#{params[:query]}%").distinct
  end
end
