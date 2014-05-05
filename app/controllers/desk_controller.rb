class DeskController < ApplicationController
  skip_before_filter :check_auth

  def index
  end
end
