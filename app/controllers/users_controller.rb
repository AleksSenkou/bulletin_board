class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
  end

  private
    # def set_user
    #   @user = User.find(params[:id])
    # end
end
