# config/initializers/omniauth.rb
require 'omniauth'
require 'omniauth-google-oauth2'

Rails.application.config.middleware.use OmniAuth::Builder do
  provider :google_oauth2,
    ENV['GOOGLE_CLIENT_ID'],
    ENV['GOOGLE_CLIENT_SECRET'],
    {
      scope: 'youtube.upload youtube',
      access_type: 'offline',
      prompt: 'consent'
    }
end

OmniAuth.config.allowed_request_methods = %i[get post]
OmniAuth.config.silence_get_warning = true