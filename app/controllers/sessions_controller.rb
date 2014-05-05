class SessionsController < ApplicationController

  def create
    auth = env["omniauth.auth"]
    user = User.from_omniauth(auth)
    session[:user_id] = user.id
    access_token = auth["extra"]["access_token"]
    session[:oauth_token] = access_token.token
    session[:oauth_secret] = access_token.secret
    redirect_to root_url, notice: "Signed in!"
  end

  def destroy
    session[:user_id] = nil
    session[:oauth_token] = nil
    session[:oauth_secret] = nil
    redirect_to root_url, notice: "Signed out!"
  end

end
