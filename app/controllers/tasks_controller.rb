class TasksController < ApplicationController
before_action :logged_in_user
skip_before_action :verify_authenticity_token
  def apply
    @user=User.find_by(id: cookies.signed[:user_id])
    @task_and_user=current_user.task_and_users.build(task_and_user_params)

    if  TaskAndUser.find_by(task_id: @task_and_user.task_id,user_id:@task_and_user.user_id).nil?
      @task_and_user.ispassed=0
      if @task_and_user.save
        flash[:success] = "报名成功，请等待发布者通过！"
        redirect_to @user
      else
        render 'tasks/detail'
      end
    else
      flash[:success] = "已报名"
    end

  end

  def show
    @user= User.find_by(id: cookies.signed[:user_id])
    @tasks=@user.tasks.paginate(page: params[:page],per_page: 10)
  end

  def detail
    @id=params[:taskid]
    @task=Task.find(@id)
    @user=User.find_by(id: cookies.signed[:user_id])
    @task_and_user=current_user.task_and_users.build
    @verify=TaskAndUser.find_by(task_id: @task.id,user_id:@user.id)
    @applicant=TaskAndUser.joins(:users).where("task_id=? and ispassed = 0",@task.id)

  end

  def submit
    @user=User.find_by(id: cookies.signed[:user_id])
    @task=current_user.tasks.build(task_params)
    if @task.save
      flash[:success] = "课题招募创建成功！"
      redirect_to @user
    else
      render 'edit'
    end
  end


  def edit
    @user=User.find_by(id: cookies.signed[:user_id])
    @task=current_user.tasks.build
  end

  def delete
  end

  def destroy

  end

  private
  def task_params
      params.require(:task).permit(:theme, :stuid, :content, :abstract, :stuid, :totalnum)
  end
  def task_and_user_params
     params.require(:task_and_user).permit(:user_id, :task_id)
  end
end
