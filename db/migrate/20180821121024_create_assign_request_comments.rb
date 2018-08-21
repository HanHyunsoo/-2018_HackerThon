class CreateAssignRequestComments < ActiveRecord::Migration
  def change
    create_table :assign_request_comments do |t|
      t.string :content
      t.integer :u_id
      t.integer :request_id

      t.timestamps null: false
    end
  end
end
