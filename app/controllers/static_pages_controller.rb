class StaticPagesController < ApplicationController
  def home
    @adverts = Advert.all.paginate(page: params[:page], per_page: 20)
  end
end
