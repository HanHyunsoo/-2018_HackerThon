class CreateAssignRequests < ActiveRecord::Migration
  def change
    create_table :assign_requests do |t|
      t.text :content
      t.integer :s_id
      t.integer :c_id
      t.integer :g_private
      t.string :img_url, default: ""
      t.timestamps null: false
    end
  end
end
