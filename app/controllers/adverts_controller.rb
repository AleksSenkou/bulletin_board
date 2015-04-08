class AdvertsController < ApplicationController
  before_action :authenticate_user!, except: [:index]

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
    @advert = current_user.adverts.find(params[:id])
    @pictures = @advert.pictures
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
