class BookingsController < ApplicationController
  before_action :set_deck, only: %i[new create]
  def index
    @bookings = filter_bookings(Booking.all)
    # @bookings = Booking.where("user_id = ?", @user.id)
    @booking = Booking.new
  end

  def new; end

  def create
    @booking = Booking.new(booking_params)

    @booking.user = current_user
    @booking.deck = @deck

    if @booking.save
      redirect_to bookings_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def filter_bookings(bookings)
    bookings.select { |booking| booking.user == current_user}
  end

  def set_deck
    @deck = Deck.find(params[:deck_id])
  end

  def booking_params
    params.require(:booking).permit(:date_of_beginning, :date_of_end)
  end
end
