class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: :home

  def home
    studios = Studio.all
    sorted = studios.sort_by(&:created_at)
    @top = sorted.reverse.first(6)
  end
end
