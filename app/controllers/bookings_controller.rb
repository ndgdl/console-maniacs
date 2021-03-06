class BookingsController < ApplicationController

# CRUD OPERATIONS FROM ALL USERS

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
    @console = Console.find(params[:console_id])
    authorize @booking
    @booking.user = current_user
    @booking.console = @console

    if @booking.save
      redirect_to booked_consoles_path
    else
      render :new
    end
  end

  def edit
    @booking = Booking.find(params[:id])
    @console = Console.find(params[:console_id])
    authorize @booking
  end

  def update
    @booking = Booking.find(params[:id])
    authorize @booking

    if @booking.update(booking_params)
      redirect_to booked_consoles_path
    else
      render :edit
    end
  end


  def destroy
    @booking = Booking.find(params[:id])
    authorize @booking
    @booking.destroy
    redirect_to booked_consoles_path
  end

  # APPROVE OR DENY BUTTONS ONLY FOR OWNERS

  def approve
    @booking = Booking.find(params[:id])
    @booking.status = "accepted"
    @booking.save

    authorize @booking
    redirect_to owned_consoles_path
  end

  def deny
    @booking = Booking.find(params[:id])
    @booking.status = "denied"
    @booking.save

    authorize @booking

    redirect_to owned_consoles_path
  end

  private

  def booking_params
    params.require(:booking).permit(:start_date, :end_date, :console_id)
  end
end
