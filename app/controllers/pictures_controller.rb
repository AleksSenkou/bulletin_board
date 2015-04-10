class PicturesController < ApplicationController
  before_action :authenticate_user!, only: [:destroy]

  def destroy
    # @picture = Picture.find(params[:id])
    @picture.destroy
    redirect_to edit_advert_url @picture.advert
  end

  private
    def set_picture
      @picture = current_user.adverts.find[params[:advert_id]].pictures.find[params[:id]]
    end
end
