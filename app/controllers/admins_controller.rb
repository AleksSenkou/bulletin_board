class AdminsController < ApplicationController
  before_action :authenticate_user!
  before_action :admin_user

  def all_users
    @users = User.paginate(page: params[:page], per_page: 20)
  end


  def all_adverts
    @adverts = Advert.paginate(page: params[:page], per_page: 20)
  end

  private
    def admin_user
      redirect_to root_url unless admin?
    end
end
