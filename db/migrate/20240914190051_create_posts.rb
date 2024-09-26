class CreatePosts < ActiveRecord::Migration[7.1]
  def change
    create_table :posts do |t|
      t.string :title
      t.text :body  # body カラムを追加
      t.timestamps
    end
  end
end
