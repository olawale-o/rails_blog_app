class CreatePosts < ActiveRecord::Migration[6.1]
  def change
    create_table :posts do |t|
      t.references :author, null: false, foreign_key: { to_table: :users }, index: { name: 'idx_posts_user_id' }
      t.string :title, null: false, default: 'title'
      t.text :text, null: false, default: 'short text'
      t.timestamps
      t.integer :comments_counter, null: false, default: 0
      t.integer :likes_counter, null: false, default: 0
    end
  end
end
