class BookingsController < ApplicationController
  def index
  end

  def new
    @booking = Booking.new
  end

  def create
    @booking = Booking.new(booking_params)

    @booking.user = @user
    @booking.deck = @deck

    if @booking.save
      redirect_to root_path
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

  def booking_params
    params.require(:booking).permit(:date_of_beginning, :date_of_end)
  end
end
