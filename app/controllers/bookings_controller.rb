class BookingsController < ApplicationController
  def new
    @studio = Studio.find(params[:studio_id])
    @booking = Booking.new()
  end

  def create
    @booking = Booking.new(booking_params)
    @studio = Studio.find(params[:studio_id])
    @booking.studio = @studio
    @booking.user = current_user
    @booking.status = "To be confirmed"
    if @booking.save
      redirect_to studio_path(@studio)
    else
      redirect_to new_studio_booking_path(@studio)
    end
  end

  def display

  end

  private

  def booking_params
    params.require(:booking).permit( :start_date, :end_date, :status )
  end
end
