class AddColumnAbstractToTask < ActiveRecord::Migration[6.0]
  def change
    add_column :tasks,:abstract,:text
  end
end
