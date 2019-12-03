class CreateSignins < ActiveRecord::Migration[6.0]
  def change
    create_table :signins do |t|
      t.integer :stuid
      t.string :pwd
      t.string :authority

      t.timestamps
    end
  end
end
