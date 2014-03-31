class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      flash[:notice] = 'Welcome to Agora.'
      sign_in @user
      redirect_to root_url
    else
      render :new
    end
  end

  def show
    @user = User.find_by_username params[:id]
  end

  private

  def user_params
    params.require(:user).permit(%i(
      username password password_confirmation email
    ))
  end
end
