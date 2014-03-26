class SessionsController < ApplicationController
  def new
    if signed_in?
      flash.now[:error] = "You're already signed in."
      redirect_to root_url
    end
  end

  def create
    user = User.find_by_username params[:session][:username]
    if user && user.authenticate(params[:session][:password])
      flash[:notice] = 'Welcome back.'
      sign_in user
      redirect_to root_url
    else
      flash.now[:error] = 'Invalid username/password combination'
      render :new
    end
  end

  def github_login
    auth = request.env['omniauth.auth']
    user = User.find_or_create_by_omniauth(auth)
    flash[:notice] = 'Welcome back.'
    sign_in user
    redirect_to :back
  end

  def destroy
    sign_out
    redirect_to :root
  end
end
