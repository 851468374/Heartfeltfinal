class CreateTasks < ActiveRecord::Migration[6.0]
  def change
    create_table :tasks do |t|
      t.string :theme
      t.string :stuid
      t.string :content
      t.integer :hotpot
      t.integer :applicant

      t.timestamps
    end
  end
end
