class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.integer :author_id, null: false
      t.text :body
      t.string :title

      t.timestamps
    end
  end
end
