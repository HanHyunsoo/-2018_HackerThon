class CreateRequestStatuses < ActiveRecord::Migration
  def change
    create_table :request_statuses do |t|
      t.integer :g_id
      t.integer :g_s_id
      t.integer :g_c_id
      t.integer :status_id
      t.string :status_img
      t.text :status_content

      t.timestamps null: false
    end
  end
end
