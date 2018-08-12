class CreatePortfolios < ActiveRecord::Migration
  def change
    create_table :portfolios do |t|
      t.string :img_url, default: "" #포트폴리오 이미지
      t.text :content #포트폴리오 설명글
      # t.integer :g_id #물건 id(goods_id)
      

      t.timestamps null: false
    end
  end
end
