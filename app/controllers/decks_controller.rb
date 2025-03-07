require "open-uri"

class DecksController < ApplicationController
  before_action :set_deck, only: %i[show edit update destroy]
  before_action :set_cards, only: %i[new edit]
  skip_before_action :authenticate_user!, only: %i[index show]

  # See others decks
  def index
    @decks = Deck.all
    @decks = search_decks(@decks) if params[:query].present?
    @decks = others_decks(@decks) unless current_user.nil?
  end

  # See self decks
  def my_decks
    @decks = Deck.all
    @decks = self_decks(@decks)
  end

  def show
    @booking = Booking.new
  end

  def new
    @deck = Deck.new
  end

  def create
    @deck = Deck.new(deck_params)
    @deck.user = current_user

    if @deck.save
      save_deck_cards
      redirect_to deck_path(@deck)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit; end

  def update
    if @deck.update(deck_params)
      redirect_to deck_path(@deck)
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @deck.destroy
    redirect_to my_decks_path, status: :see_other
  end

  private

  def set_cards
    @cards = Card.all
  end

  def set_deck
    @deck = Deck.find(params[:id])
  end

  def deck_params
    params.require(:deck).permit(:title, :description, :price)
  end

  def save_deck_cards
    ids = params[:deck][:card_ids].map { |element| element.to_i }
    ids.delete_at(0)
    cards = ids.map { |id| Card.find(id) }
    cards.each do |card|
      DeckCard.create(deck_id: @deck.id, card_id: card[:id])
    end
    cloudinary_url = @deck.cards.first.photo.url
    file = URI.parse(cloudinary_url).open

    @deck.photo.attach(io: file, filename: "pokemon")
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
