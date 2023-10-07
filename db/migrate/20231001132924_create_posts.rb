class CreatePosts < ActiveRecord::Migration[7.0]
  def change
    create_table :posts do |t|
      t.references :list_member, foreign_key: true, null: false
      t.integer :source, null: false
      t.text :content, null: false
      t.datetime :posted_at, null: false
      t.timestamps
    end

    add_index :posts, [:source, :posted_at], name: 'posts_index'
  end
end
