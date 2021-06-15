class BookingsController < ApplicationController
  def new
    @studio = Studio.find(params[:studio_id])
    @booking = Booking.new()
  end

  def create
    @booking = Booking.new(booking_params)
    @studio = List.find(params[:studio_id])
    @booking.studio = @studio
    @user = User.find(params[:booking][:user_id])
    @booking.user = @user
    if @booking.save
      redirect_to studio_path(@studio)
    else
      redirect_to new_studio_booking_path(@studio)
    end
  end

  def delete

  end

  private

  def booking_params
    params.require(:booking).permit(:studio, :user_id, :comment)
  end
end
