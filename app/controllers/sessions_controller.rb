class SessionsController < ApplicationController
  def new
    if signed_in?
      flash[:error] = "You're already signed in as #{current_user.username}"
      redirect_to root_url
    end
  end

  def create
    user = User.find_by_username params[:session][:username]
    if user && user.authenticate(params[:session][:password])
      sign_in user
      redirect_to root_url
    else
      flash.now[:error] = 'Invalid username/password combination'
      render :new
    end
  end

  def destroy
    sign_out
    redirect_to root_url
  end
end