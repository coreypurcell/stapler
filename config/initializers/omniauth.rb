OmniAuth.config.logger = Rails.logger

Rails.application.config.middleware.use OmniAuth::Builder do
  provider :desk, 'ctN2hmdaBEO88RxxQImm', 'PSlpfGqLvqkpzhqMaIhHmm73EyVAD9gzzCD3dr4l', :site => 'https://confbots.desk.com'
end
