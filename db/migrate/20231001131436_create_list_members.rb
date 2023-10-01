class CreateListMembers < ActiveRecord::Migration[7.0]
  def change
    create_table :list_members do |t|
      t.references :list, foreign_key: true, null: false
      t.string :first_name, null: false, limit: 100
      t.string :last_name, null: false, limit: 100
      t.timestamps
    end
  end
end
