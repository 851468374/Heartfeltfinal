class SessionsController < ApplicationController
  def new
  end

  def create  #验证用户

    signin=Signin.find_by(stuid: params[:session][:stuid].downcase)
    if signin && signin.authenticate(params[:session][:pwd])
      @user=User.find_by_stuid(params[:session][:stuid].downcase)
      puts(@user)
    log_in signin
    redirect_to @user
    else
      flash.now[:danger] ='错误的学号/密码'
      render 'new'
    end
  end
  def user_params
    @params.require(:user).permit(:stuid, :authority,:password, :password_confirmation)
  end
  def destroy

  end
end
