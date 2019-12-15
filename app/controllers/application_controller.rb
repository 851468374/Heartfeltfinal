class ApplicationController < ActionController::Base
  protect_from_forgery
  include SessionsHelper
  private


  #保证用户已登录
    def logged_in_user
      unless logged_in?
    #    store_location
        flash[:danger] ="请登录！"
        redirect_to login_url
      end
    end




end
