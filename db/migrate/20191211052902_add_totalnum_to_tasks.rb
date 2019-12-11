class AddTotalnumToTasks < ActiveRecord::Migration[6.0]
  def change
    add_column :tasks, :totalnum, :integer
  end
end
