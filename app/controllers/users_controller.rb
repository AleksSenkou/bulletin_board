class UsersController < ApplicationController
  before_action :authenticate_user!, only: [:show]

  def show
    @user = User.find(params[:id])
  end

  private
    # def set_user
    #   @user = User.find(params[:id])
    # end
end
