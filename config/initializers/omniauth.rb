Rails.application.config.middleware.use OmniAuth::Builder do
  if Rails.env.production?
    provider :github, '443753a85110d6fc3a85', 'a6db8e865904e05aca2c6ce9dd2df4bbbe390067', scope: "user,gist"
  elsif Rails.env.development?
    provider :github, '533997e789786066df70', '6cc5033e8e4b6e17539da447e53cc93bdbb64948', scope: "user,gist"
  end

  OmniAuth.config.logger = Rails.logger
end
