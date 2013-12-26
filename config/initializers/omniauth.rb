require 'omniauth'
require 'omniauth/facebook'

OmniAuth.config.logger = Rails.logger

Rails.application.config.middleware.use OmniAuth::Builder do
  provider :developer unless Rails.env.production?
  provider :facebook,
    Rails.application.secrets.facebook_app_id,
    Rails.application.secrets.facebook_app_secret,
    secure_image_url: true, image_size: 'large'
end
