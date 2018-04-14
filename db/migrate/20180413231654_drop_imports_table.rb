class DropImportsTable < ActiveRecord::Migration[5.1]
  def change
    drop_table :imports do |t|
      t.timestamps null: false
    end
  end
end
