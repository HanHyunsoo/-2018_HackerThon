class CreateSellerPages < ActiveRecord::Migration
  def change
    create_table :seller_pages do |t|
      t.integer :s_id
      t.string :s_img
      t.string :s_introduce
      t.integer :s_port_id
      t.integer :s_review_id

      t.timestamps null: false
    end
  end
end
