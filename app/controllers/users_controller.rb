class UsersController < ApplicationController
  def show
    @user= User.find(1)
  end

  def edit

  end

  def create
    @user=User.new(user_params)
     if @user.save
       redirect_to @user
     else
       render 'new'
     end
  end

  def user_params
    @params.require(:user).permit(:stuid, :authority,:password, :password_confirmation)
  end

end
