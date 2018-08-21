class CreatePortfolios < ActiveRecord::Migration
  def change
    create_table :portfolios do |t|
      t.string :img
      t.text :content
      t.integer :g_id

      t.timestamps null: false
    end
  end
end
