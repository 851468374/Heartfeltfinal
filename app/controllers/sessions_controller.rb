class SessionsController < ApplicationController
  layout false
  def new

  end

  def register
    @signin=Signin.new
  end
  #创建用户
  def register_submit
    @signin=Signin.new(user_params)
    @user=User.new(stuid:@signin.stuid)
    if @signin.save
      log_in @user
      remember @user
      redirect_to :controller => 'users',:action => 'edit'
    else
      flash.now[:danger]='wrong text '
      render 'register'
    end
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



  #注销用户登录
  def destroy
    log_out if logged_in?
    redirect_to root_url
  end

  private
  def user_params
    params.require(:signin).permit(:stuid, :authority,:password, :password_confirmation)
  end
end
