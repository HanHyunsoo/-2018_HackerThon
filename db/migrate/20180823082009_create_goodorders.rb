class CreateGoodorders < ActiveRecord::Migration
  def change
    create_table :goodorders do |t|
      t.belongs_to :good, index: true, foreign_key: true
      t.belongs_to :order, index: true, foreign_key: true
      t.integer :quantity

      t.timestamps null: false
    end
  end
end
