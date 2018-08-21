class CreateUnassignRequests < ActiveRecord::Migration
  def change
    create_table :unassign_requests do |t|
      t.string :img
      t.text :content
      t.integer :pick_s_id
      t.integer :c_id
      t.integer :c_check
      t.integer :g_private
      t.integer :category_id

      t.timestamps null: false
    end
  end
end
