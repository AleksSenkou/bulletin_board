class AdvertsController < ApplicationController
  before_action :authenticate_user!, except: [:index]

  def new
    @advert = current_user.adverts.build
  end

  def create
    @advert = current_user.adverts.build(adverts_params)
    if @advert.save
      flash[:notice] = 'Advert had been sent to moderator'
      redirect_to root_url
    else
      render 'new'
    end
  end

  def show
    @advert = current_user.adverts.find(params[:id])
  end

  def edit
  end

  def update
  end

  def destroy
  end

  private
    def adverts_params
      params.require(:advert).permit(:name, :description, :price, :type)
    end
end
