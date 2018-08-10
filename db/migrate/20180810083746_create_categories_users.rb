class CreateCategoriesUsers < ActiveRecord::Migration
  def change
    create_table :categories_users do |t| #category_user m:n연결 테이블
      t.integer :user_id #수공업자 id
      t.integer :category_id #카테고리 id
    end
  end
end
