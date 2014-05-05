class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  def access_token
    @access_token ||= OAuth::AccessToken.from_hash(
      consumer,
      oauth_token: session[:oauth_token],
      oauth_secret: session[:oauth_secret]
    ).tap do |token|
      token.secret = session[:oauth_secret]
    end
  end

  private

  def current_user
      @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end
  helper_method :current_user

  def consumer
    OAuth::Consumer.new(
      "ctN2hmdaBEO88RxxQImm",
      "PSlpfGqLvqkpzhqMaIhHmm73EyVAD9gzzCD3dr4l",
      :site => "https://confbots.desk.com",
      :scheme => :header
    )
  end
end
