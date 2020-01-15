class AdminController < ApplicationController
  def show
    @string="select a.id
                    ,a.theme
                    ,b.name
                    ,a.created_at
             from tasks a
             inner join users b
              on a.user_id=b.id"
    @tasks=Task.find_by_sql(@string)
  end

  def delete
  end
end
