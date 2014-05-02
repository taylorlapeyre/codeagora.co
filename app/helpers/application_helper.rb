module ApplicationHelper
  def signed_in?
    session[:current_user_id].present?
  end

  def sign_in(user)
    session[:current_user_id] = user.id
  end

  def sign_out
    session[:current_user_id] = nil
  end

  def current_user
    session[:current_user_id] && User.find(session[:current_user_id])
  end

  # Takes in a vairable amount of arguments and hashes them with SHA1.
  def unique_name_for(*args)
    require 'digest/sha1'
    Digest::SHA1.hexdigest(args.join)[0..10]
  end

  # Uses gravatar, returns a image tag for the given user's email.
  def gravatar_for(user)
    gravatar_id = Digest::MD5.hexdigest(user.email.downcase)
    gravatar_url = "https://secure.gravatar.com/avatar/#{gravatar_id}"
    image_tag(gravatar_url, alt: user.username, class: 'gravatar')
  end

  def markdown(string)
    require 'rdiscount'
    RDiscount.new(string).to_html
  end
end
