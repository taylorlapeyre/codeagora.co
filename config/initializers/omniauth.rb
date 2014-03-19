Rails.application.config.middleware.use OmniAuth::Builder do
  #if Rails.env.production?
  #  provider :github, '', ''
  #elsif Rails.env.development?
    provider :github, '533997e789786066df70', '6cc5033e8e4b6e17539da447e53cc93bdbb64948'
  #end
  
  OmniAuth.config.logger = Rails.logger
end