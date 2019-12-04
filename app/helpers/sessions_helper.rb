module SessionsHelper
  def log_in(signin)
    session[:signin_id] = signin.id
  end
end
