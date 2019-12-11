class AddIspassedToTaskAndUser < ActiveRecord::Migration[6.0]
  def change
    add_column :task_and_users, :ispassed, :integer
  end
end
