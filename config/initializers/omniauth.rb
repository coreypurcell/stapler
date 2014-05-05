OmniAuth.config.logger = Rails.logger

Rails.application.config.middleware.use OmniAuth::Builder do
  provider :desk, ENV['DESK_KEY'], ENV['DESK_SECRET'], :site => 'https://confbots.desk.com'
end
