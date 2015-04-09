class UsersController < ApplicationController
  before_action :authenticate_user!, only: [:show]

  def show
    @user = User.find(params[:id])
    @adverts = @user.adverts.paginate(page: params[:page], per_page: 9)
  end

end
