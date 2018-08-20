class CreateAssignRequestsCategories < ActiveRecord::Migration
  def change
    create_table :assign_requests_categories do |t|
      t.integer :assign_request_id
      t.integer :category_id
    end
  end
end
