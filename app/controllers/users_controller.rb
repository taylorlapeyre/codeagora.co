class UsersController < ApplicationController

  # Renders the "Create Account" page.
  def new
    @user = User.new
  end

  # The method that actually handles a "create account" POST request.
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

  #  A User profile page. Takes in a username.
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
