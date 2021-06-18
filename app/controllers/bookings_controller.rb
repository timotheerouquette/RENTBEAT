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
    if @booking.save!
      redirect_to my_bookings_path, notice: "Confirmed!"
    else
      render "studios/show"
    end
  end

  def confirm
    @booking = Booking.find(params[:id])
    authorize @booking
    @studio = @booking.studio
    @booking.status = "Confirmed"
    @booking.save
    redirect_back(fallback_location: my_bookings_path, notice: "Confirmed!")
    # redirect_to studio_path(@studio), notice: "Confirmed!"
  end

  def cancel
    @booking = Booking.find(params[:id])
    authorize @booking
    @studio = @booking.studio
    @booking.status = "Canceled"
    @booking.save
    redirect_back(fallback_location: my_bookings_path, notice: "Canceled!")
    # redirect_to studio_path(@studio), notice: "Canceled!"
  end

  def display
    authorize :booking, :display?
  end

  private

  def booking_params
    params.require(:booking).permit( :start_date, :end_date, :status )
  end
end
