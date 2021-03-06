class CreateUsers < ActiveRecord::Migration[6.1]
  def change
    create_table :users do |t|
      t.string :name, null: false, default: 'name'
      t.string :photo, null: false, default: 'https://i.pravatar.cc/150?img=2'
      t.text :bio, null: false, default: 'short bio'
      t.timestamps
      t.integer :posts_counter, null: false, default: 0
    end
  end
end
