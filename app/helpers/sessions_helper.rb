module SessionsHelper
  #登入用户
  def log_in(signin)
    session[:signin_id] = signin.id
  end
  #返回当前登录的用户（如果有就返回）
  def current_user
    @current_user ||=User.find_by(id: session[:signin_id])
  end
  #判断用户是否登录，若登录，就返回true，否则返回false
  def logged_in?
    !current_user.nil?
  end
end
