class AdvertsController < ApplicationController
  before_action :authenticate_user!, except: :show
  before_action :set_advert, except: [:new, :create]
  before_action :correct_user, only: [:edit, :update, :destroy]

  def new
    @advert = current_user.adverts.build
  end

  def create
    @advert = current_user.adverts.build(adverts_params)

    respond_to do |format|
      if @advert.save
        if params[:images]
          params[:images].each do |image|
            @advert.pictures.create(image: image)
          end
        end
        format.html {
          flash[:notice] = 'Advert had been sent to moderator'
          redirect_to @advert
        }
      else
        format.html { render action: 'new' }
      end
    end
  end

  def show
    @user = @advert.user
    @pictures = @advert.pictures
  end

  def edit
  end

  def update
    respond_to do |format|
      if @advert.update_attributes(adverts_params)
        if params[:images]
          params[:images].each do |image|
            @advert.pictures.create(image: image)
          end
        end
        format.html {
          flash[:notice] = 'Advert was successfully updated.'
          redirect_to @advert
        }
      else
        format.html { render action: 'edit' }
      end
    end
  end

  def destroy
    @advert.destroy
    redirect_to current_user
  end

  def upvote
    @advert.liked_by current_user
    redirect_to :back
  end

  private
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
