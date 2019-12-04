class TasksController < ApplicationController
  def show
  end

  def detail
  end

  def edit
    @task=Task.new #创建一个Task的对象，用来存放用户新发布的招募
    @user=User.find(1)
  end

  def delete
  end

  def create
    @task=Task.new(task_params)
    if @task.save
      puts("发布成功")
    else
      render 'edit'
    end
  end








  private
  def task_params
    params.require(:task).permit(:theme, :stuid, :content)
  end



end
