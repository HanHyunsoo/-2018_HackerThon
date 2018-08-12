class CreateArticles < ActiveRecord::Migration
  def change
    create_table :articles do |t|
      t.string :title
      t.text :content

      t.timestamps null: false
    end
  end
end

# class CreateArticles < ActiveRecord::Migration
#   def change
#     create_table :articles do |t|

#       t.string :title
#       t.text :content
#       t.integer :u_id #작성자 id
#       t.integer :b_id #게시판 종류 id (board_id)
#       t.string :img_url, default: "" #이미지
      
#       t.timestamps null: false
#     end
#   end
# end