class CreateLists < ActiveRecord::Migration[7.0]
  def change
    create_table :lists do |t|
      t.integer :list_type, null: false
      t.string :name, null: false
      t.timestamps
    end

    add_index :lists, [:list_type, :name], name: "lists_index", unique: true
  end
end
