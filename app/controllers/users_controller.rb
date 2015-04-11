class UsersController < ApplicationController
  before_action :authenticate_user!
  before_action :admin_user, only: [:index]
  before_action :correct_user, only: [:destroy]

  def index
    @users = User.paginate(page: params[:page], per_page: 20)
  end

  def show
    @user = User.find(params[:id])
    @adverts = @user.adverts.paginate(page: params[:page], per_page: 6)
  end

  def destroy
    @user.destroy
    if admin?
      flash[:notice] = 'User deleted'
    else
      flash[:notice] = 'Bye! Your account has been successfully cancelled. We hope to see you again soon.'
    end
    redirect_to root_url
  end

  private
    def admin_user
      redirect_to root_url unless current_user.admin?
    end

    def correct_user
      @user = User.find(params[:id])
      unless current_user == @user || admin?
        redirect_to root_url
      end
    end
end
