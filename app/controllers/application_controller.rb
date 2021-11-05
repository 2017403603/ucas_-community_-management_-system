class ApplicationController < ActionController::Base
    protect_from_forgery with: :exception
  
    # helper_method :check_login
  end
  