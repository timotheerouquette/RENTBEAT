class BookingsController < ApplicationController
  def new
    @studio = Studio.find(params[:studio_id])
    @booking = Booking.new()
    authorize @booking
  end

  def create
    @booking = Booking.new(booking_params)
    @studio = Studio.find(params[:studio_id])
    authorize @booking
    @booking.studio = @studio
    @booking.user = current_user
    @booking.status = "To be confirmed"
    if @booking.save
      redirect_to my_bookings_path
    else
      redirect_to new_studio_booking_path(@studio)
    end
  end

  def edit
    @booking = Booking.find(params[:id])
    authorize @booking
  end

  def update
    @booking = Booking.find(params[:id])
    @booking.update(booking_params)
    authorize @booking

    redirect_to studio_path(@studio)
  end

  def display
    authorize :booking, :display?
  end

  private

  def booking_params
    params.require(:booking).permit( :start_date, :end_date, :status )
  end
end
