class AdvertsController < ApplicationController
  before_action :authenticate_user!, except: [:show]
  before_action :correct_user, only: [:edit, :update, :destroy]
  before_action :admin_user, only: [:index]

  def index
    @adverts = Advert.paginate(page: params[:page], per_page: 20)
  end

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
    @advert = Advert.find(params[:id])
    @user = @advert.user
    @pictures = @advert.pictures
  end

  def edit
    @pictures = @advert.pictures
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

  private
    def correct_user
      @advert = Advert.find(params[:id])
      unless @advert.user == current_user || admin?
        redirect_to @advert, alert: 'Access denied.'
      end
    end

    def adverts_params
      params.require(:advert).permit(:name, :description, :price, :type)
    end

    def admin_user
      redirect_to root_url unless admin?
    end
end
