class CreateGoods < ActiveRecord::Migration
  def change
    create_table :goods do |t|
      t.integer :s_id
      t.integer :c_id
      t.string :price
      t.string :image_url
      t.text :content
      t.integer :ar_private
      t.integer :ar_order_id
      t.integer :ur_order_id
      t.integer :ur_private
      t.integer :ar_category_id
      t.integer :ur_category_id

      t.timestamps null: false
    end
  end
end
