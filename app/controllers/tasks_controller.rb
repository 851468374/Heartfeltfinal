class TasksController < ApplicationController
  before_action :logged_in_user, only: [ :destroy, :edit]
  def show
  end

  def detail
  end

  def edit
    @task=current_user.tasks.build if logged_in?
    @user=User.find_by(id: cookies.signed[:user_id])
    puts( @user.name)
    if @task.save
      flash[:success] = "课题招募创建成功！"
      redirect_to @user
    else
      render 'edit'
    end
  end

  def delete
  end

  def destroy

  end

  private
  def task_params
    params.require(:task).permit(:theme, :stuid, :content)
  end
end
