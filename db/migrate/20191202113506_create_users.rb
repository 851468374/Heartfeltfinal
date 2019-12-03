class CreateUsers < ActiveRecord::Migration[6.0]
  def change
    create_table :users do |t|
      t.string :stuid
      t.string :name
      t.integer :age
      t.string :school
      t.string :currterm
      t.string :email
      t.string :tel

      t.timestamps
    end
  end
end
