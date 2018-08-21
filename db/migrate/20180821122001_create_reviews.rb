class CreateReviews < ActiveRecord::Migration
  def change
    create_table :reviews do |t|
      t.integer :g_id
      t.text :content
      t.string :img
      t.integer :g_s_id
      t.integer :g_c_id

      t.timestamps null: false
    end
  end
end
