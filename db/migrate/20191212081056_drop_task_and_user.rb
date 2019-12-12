class DropTaskAndUser < ActiveRecord::Migration[6.0]
  def change
    drop_table :task_and_users
  end
end
