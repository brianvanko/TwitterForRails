OmniAuth.config.logger = Rails.logger

Rails.application.config.middleware.use OmniAuth::Builder do
  provider :facebook, '260242310792243', '3e5743958d080d529942144aa8c0a92f', :display => 'popup'
end