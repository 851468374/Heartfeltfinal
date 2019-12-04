class SessionsController < ApplicationController
  def new
  end

    #验证用户登录
  def create

    signin=Signin.find_by(stuid: params[:session][:stuid].downcase)
    if signin && signin.authenticate(params[:session][:pwd])
      user=User.find_by_stuid(params[:session][:stuid].downcase)
    log_in user
    remember user
    redirect_to user
    else
      flash.now[:danger] ='错误的学号/密码'
      render 'new'
    end
  end

  def user_params
    @params.require(:user).permit(:stuid, :authority,:password, :password_confirmation)
  end

  #注销用户登录
  def destroy
    log_out if logged_in?
    redirect_to root_url
  end
end
