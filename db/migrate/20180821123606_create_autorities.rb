class CreateAutorities < ActiveRecord::Migration
  def change
    create_table :autorities do |t|
      t.string :name

      t.timestamps null: false
    end
  end
end
