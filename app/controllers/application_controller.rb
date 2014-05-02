class ApplicationController < ActionController::Base
  include ApplicationHelper
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  # For rendering the 404 page
  def not_found
    fail ActionController::RoutingError, 'Not Found'
  end
end
