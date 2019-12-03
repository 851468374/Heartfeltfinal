class CreateHotspots < ActiveRecord::Migration[6.0]
  def change
    create_table :hotspots do |t|
      t.string :theme
      t.string :stuid
      t.string :content
      t.integer :hotpot

      t.timestamps
    end
  end
end
