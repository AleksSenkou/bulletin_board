class PicturesController < ApplicationController
  before_action :authenticate_user!, only: :destroy
  before_action :set_picture
  before_action :correct_picture, only: :destroy

  def show
  end

  def destroy
    @picture.destroy
    respond_to do |format|
      format.html { redirect_to edit_advert_url @picture.advert }
      # format.js
    end
  end

  private
    def set_picture
      @picture = Picture.find(params[:id])
    end

    def correct_picture
      unless @picture.advert.user == current_user
        redirect_to edit_advert_url(@picture.advert), alert: 'Access denied.'
      end
    end
end
