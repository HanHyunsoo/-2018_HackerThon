class CreateUnassignRequestComments < ActiveRecord::Migration
  def change
    create_table :unassign_request_comments do |t|
      t.string :price
      t.text :content
      t.integer :s_id
      t.integer :request_id

      t.timestamps null: false
    end
  end
end
