class TasksController < ApplicationController
  before_action :logged_in_user
  skip_before_action :verify_authenticity_token

  def permit
    @state=params[:state]
    @id=params[:task_id]
    @task=TaskUser.find_by(task_id: @id)
    if @state == '0'
      @task.update(state: 1)
      redirect_to tasks_detail_path(taskid:@id)
    elsif @state == '1'
      @task.update(state: 0)
      redirect_to tasks_detail_path(taskid:@id)
    end

  end


  def apply
    @user=User.find_by(id: cookies.signed[:user_id])
    @task_user=current_user.task_users.build(task_user_params)

    if  TaskUser.find_by(task_id: @task_user.task_id,user_id:@task_user.user_id).nil?
      @task_user.state=0
      if @task_user.save
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
    @tasks=Task.all.paginate(page: params[:page],per_page: 10)
  end

  def detail
    @id=params[:taskid]
    @task=Task.find(@id)
    @user=User.find_by(id: cookies.signed[:user_id])
    @task_user=current_user.task_users.build
    @verify=TaskUser.find_by(task_id: @task.id,user_id:@user.id)
    @string="select  a.name
                    ,a.school
                    ,a.age
                    ,a.school
                    ,a.currterm
                    ,b.user_id
                    ,b.task_id
                    ,b.state
                    from users a
                    inner join task_users b
                    on a.id=b.user_id
                    where b.task_id= #{@id} "
    @applicants=User.find_by_sql(@string)





  end

  def submit
    @user=User.find_by(id: cookies.signed[:user_id])
    @task=current_user.tasks.build(task_params)
    if  @task.save
      flash[:success] = "课题招募创建成功！"
      redirect_to @user
    else
      puts ("失败失败失败")
      render 'edit'
    end
  end


  def edit
    @user=User.find_by(id: cookies.signed[:user_id])
    @task=current_user.tasks.build
  end

  def delete
    @taskid=params[:task_id]
    @task=Task.find(@taskid)
    if @task.destroy
      redirect_to controller: 'admin',action: 'show'
    else
      render controller: 'admin',action: 'show'
    end
  end

  def destroy

  end

  private
  def task_params
      params.require(:task).permit(:theme, :stuid, :content, :abstract,  :totalnum)
  end
  def task_user_params
     params.require(:task_user).permit(:user_id, :task_id)
  end

  def task_permit_params
    params.require(:task_user).permit(:user_id, :task_id)
  end
end
