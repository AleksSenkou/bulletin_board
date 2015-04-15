class AdvertsController < ApplicationController
  before_action :authenticate_user!, except: :show
  before_action :set_advert, except: [:new, :create]
  before_action :correct_user, only: [:edit, :update, :destroy]

  def new
    @advert = current_user.adverts.build
  end

  def create
    @advert = current_user.adverts.build(adverts_params)

    if @advert.save
      load_images
      flash[:notice] = 'Advert had been sent to moderator'
      redirect_to @advert
    else
      render action: 'new'
    end
  end

  def show
    @user = @advert.user
    @pictures = @advert.pictures
  end

  def edit
  end

  def update
    if @advert.update_attributes(adverts_params)
      load_images
      flash[:notice] = 'Advert was successfully updated.'
      redirect_to @advert
    else
      render action: 'edit'
    end
  end

  def destroy
    @advert.destroy
    redirect_to current_user
  end

  def like
    @advert.liked_by current_user
    if !@advert.vote_registered?
      @advert.unliked_by current_user
    end
    respond_to do |format|
      format.html { redirect_to :back }
      format.js
    end
  end

  def dislike
    @advert.disliked_by current_user
    if !@advert.vote_registered?
      @advert.undisliked_by current_user
    end
    respond_to do |format|
      format.html { redirect_to :back }
      format.js
    end
  end

  private
    def load_images
      if params[:images]
        params[:images].each do |image|
          @advert.pictures.create(image: image)
        end
      end
    end

    def set_advert
      @advert = Advert.find(params[:id])
    end

    def correct_user
      unless @advert.user == current_user || admin?
        redirect_to @advert, alert: 'Access denied.'
      end
    end

    def adverts_params
      params.require(:advert).permit(:name, :description, :price, :type)
    end
end
