class AddBIdToArticles < ActiveRecord::Migration
  def change
    add_column :articles, :board_id, :integer
  end
end
