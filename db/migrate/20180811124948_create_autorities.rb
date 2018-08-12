class CreateAutorities < ActiveRecord::Migration
  def change
    create_table :autorities do |t|
      t.string :name

      t.timestamps null: false
    end
  end
end
#회원 권한
# 0: 관리자
# 1: 수공업자
# 2: 일반회원
# seed.rb파일에 작성되어있음