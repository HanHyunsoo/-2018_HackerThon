class CreatePriceComfirms < ActiveRecord::Migration
  def change
    create_table :price_comfirms do |t|
      t.string :price
      t.integer :request_id
      t.integer :c_check, default: "0"

      t.timestamps null: false
    end
  end
end
