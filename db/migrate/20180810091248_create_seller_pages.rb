class CreateSellerPages < ActiveRecord::Migration
  def change
    create_table :seller_pages do |t|
      t.integer :s_id, null: false #수공업자 id
      t.string :img_url, default: "" #프사
      t.string :introduce, null: false #한줄소개
      t.integer :s_portfolio_id #포트폴리오 id
      t.integer :s_review_id #수공업자 관련 review
      
      
      t.timestamps null: false
    end
  end
end
