class AdvertsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  before_action :set_advert, only: [:edit, :update, :destroy]

  def index
    @adverts = Advert.all.paginate(page: params[:page], per_page: 30)
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
          redirect_to root_url
        }
        # format.json {}
      else
        format.html { render action: 'new' }
        # format.json {}
      end
    end
  end

  def show
    @advert = Advert.find(params[:id])
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
        # format.json {}
      else
        format.html { render action: 'edit' }
        # format.json {}
      end
    end
  end

  def destroy
    @advert.destroy
    redirect_to current_user
  end

  private
    def set_advert
      @advert = current_user.adverts.find(params[:id])
    end

    def adverts_params
      params.require(:advert).permit(:name, :description, :price, :type)
    end
end
