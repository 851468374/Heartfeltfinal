class CreateSignins < ActiveRecord::Migration[6.0]
  def change
    create_table :signins do |t|
      t.string :stuid
      t.string :password_digest
      t.string :authority

      t.timestamps
    end
  end
end
