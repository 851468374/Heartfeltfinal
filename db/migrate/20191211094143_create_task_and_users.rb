class CreateTaskAndUsers < ActiveRecord::Migration[6.0]
  def change
    create_table :task_and_users do |t|
      t.integer :task_id
      t.integer :user_id

      t.timestamps
    end
  end
end
