class CreateBooks < ActiveRecord::Migration[6.1]
  def change
    create_table :books do |t|
      t.string :name, limit: 70, null: false
      t.index :name, unique: true
      t.timestamps
    end
  end
end
