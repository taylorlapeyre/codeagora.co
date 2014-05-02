class SessionsController < ApplicationController
  # Deals with signing in users.

  # The page for showing a form to sign in.
  def new
    if signed_in?
      flash.now[:error] = "You're already signed in."
      redirect_to root_url
    end
  end

  # Creates a new session, authenticates with a passed in username & password.
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

  # Enables signing in with GitHub.
  def github_login
    auth = request.env['omniauth.auth']
    user = User.find_or_create_by_omniauth(auth)
    flash[:notice] = 'Welcome back.'
    sign_in user
    if request.env['HTTP_REFERER'].nil?
      redirect_to :root
    else
      redirect_to :back
    end
  end

  # Sign out.
  def destroy
    sign_out
    redirect_to :root
  end
end
