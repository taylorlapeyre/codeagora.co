module ApplicationHelper
  def signed_in?
    session[:current_user_id].present?
  end

  def sign_in user
    session[:current_user_id] = user.id
  end

  def sign_out
    session[:current_user_id] = nil
  end

  def current_user
    session[:current_user_id] && User.find(session[:current_user_id])
  end

  def unique_name_for *args
    require 'digest/sha1'
    Digest::SHA1.hexdigest(args.join('-'))[0..10]
  end
end
