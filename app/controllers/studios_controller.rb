class StudiosController < ApplicationController
  def index
    if params[:capacity]
      studios_price = policy_scope(Studio).where('price <= ?', params[:price])
      studios_capacity = studios_price.where('capacity >= ?', params[:capacity])
      @studios = studios_capacity.near(params[:city], 40, order: :distance)

    else
      @studios = policy_scope(Studio)
    end

    @markers = @studios.geocoded.map do |studio|
      {
        lat: studio.latitude,
        lng: studio.longitude,
        info_window: render_to_string(partial: "info_window", locals: { studio: studio }),
        image_url: helpers.asset_url('headphones.svg')
      }
    end
  end

  def show
    @studio = Studio.find(params[:id])
    @booking = Booking.new
    authorize @studio
    authorize @booking
  end

  def new
    @studio = Studio.new
    authorize @studio
  end

  def create
    @studio = Studio.new(studio_params)
    @studio.user = current_user
    authorize @studio
    if @studio.save
      redirect_to studio_path(@studio)
    else
      render :new
    end
  end

  def edit
    @studio = Studio.find(params[:id])
    authorize @studio
  end

  def update
    @studio = Studio.find(params[:id])
    @studio.update(studio_params)
    authorize @studio

    redirect_to studio_path(@studio)
  end

  def destroy
    @studio = Studio.find(params[:id])
    authorize @studio
    @studio.destroy

    redirect_to my_studios_path
  end

  def display
    authorize :booking, :display?
    @studios = current_user.studios
  end

  private

  def studio_params
    params.require(:studio).permit(:title, :address, :description, :photos, :price, :capacity)
  end
end
