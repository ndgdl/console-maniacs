class BookingsController < ApplicationController
  def index
    @bookings = policy_scope(current_user.bookings)
  end

  def show
  end

  def new
    @booking = Booking.new
    @console = Console.find(params[:console_id])
    authorize @booking
  end

  def create
    @booking = Booking.new(booking_params)

    authorize @booking

    @booking.user = current_user
    @booking.console = Console.find(params[:console_id])

    if @booking.save
      redirect_to booked_consoles_path(current_user)
    else
      render :new
    end
  end

  def edit
    @booking = Booking.find(params[:id])
  end

  def update
    @booking.update(booking_params)
  end

  def destroy
    @booking = Booking.find(params[:id])
    @booking.destroy
  end

  private

  def booking_params
    params.require(:booking).permit(:starting_date, :ending_date, :console_id)
  end
end
