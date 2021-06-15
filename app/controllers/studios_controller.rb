class StudiosController < ApplicationController
  def index
    @studios = policy_scope(Studio)
  end

  def show
    @studio = Studio.find(params[:id])
    authorize @studio
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
  end

  def update
    authorize @studio
    @studio = Studio.find(params[:id])
    @studio.update(studio_params)

    redirect_to studio_path(@studio)
  end

  def destroy
    @studio = Studio.find(params[:id])
    authorize @studio
    @studio.destroy

    redirect_to studios_path
  end

  private

  def studio_params
    params.require(:studio).permit(:title, :address, :description, :photos, :price, :capacity)
  end
end
