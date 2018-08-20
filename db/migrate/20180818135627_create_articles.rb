class CreateArticles < ActiveRecord::Migration
  def change
    create_table :articles do |t|
      t.string :title
      t.text :content
      t.integer :board_id
      t.string :img, default: ""
      t.timestamps null: false
    end
  end
end
