class UsersController < ApplicationController
  before_action :logged_in_user,only: [:index, :edit, :update, :destroy]

  def home
    
  end
  def show
    @id=cookies.signed[:user_id]
    @string="select  a.name
                     ,c.theme
                     ,c.created_at
                    ,c.id
                    from users a
                    inner join task_users b
                    on a.id=b.user_id
                    inner join tasks c
                    on b.task_id=c.id
                    where a.id= #{@id}
                    and b.state =0"
    @user=User.find_by(id: cookies.signed[:user_id])
    @tasks=@user.tasks.paginate(page: params[:page],per_page: 10)
    @apply=Task.find_by_sql(@string)
  end

  def submit_edit
    @user=User.find_by(id: cookies.signed[:user_id])
    name=params[:user][:name]
    age=params[:user][:age]
    school=params[:user][:school]
    currterm=params[:user][:currterm]
    tel=params[:user][:tel]
    email=params[:user][:email]
    @user.name=name
    @user.age=age
    @user.school=school
    @user.currterm=currterm
    @user.tel=tel
    @user.email=email

    if @user.save
      redirect_to controller: "tasks",action: "show"
    else
      render 'users/edit'
    end


  end
  def edit
  @user=User.find_by(id: cookies.signed[:user_id])
  end

  def create
    @user=User.new(user_params)
     if @user.save
       redirect_to @user
     else
       render 'new'
     end
  end

  #确保用户正确
  def correct_user
    @user=User.find(params[:id])
    redirect_to(root_url) unless current_user?(@user)
  end

  def admin_user
    redirect_to(root_url) unless current_user.admin?
  end

  private
  def user_info_params
    @params.require(:user).permit(:name, :age)
  end
  def user_params
    @params.require(:user).permit(:stuid, :authority,:password, :password_confirmation)
  end
end
