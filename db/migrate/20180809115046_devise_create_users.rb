# frozen_string_literal: true

class DeviseCreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      ## Database authenticatable
      t.string :email,              null: false #user_id
      t.string :encrypted_password, null: false, default: ""
      
      ##추가
      t.string :name, null: false   #이름
      t.string :mail, null: false   #이메일
      t.string :authorization, default: 2 #권한
      t.string :business_number, null: true #사업자번호(일반사용자 입력x)
      t.string :phone_number, null: false #핸드폰번호
      t.string :address, null: false      #집주소
      t.string :postcode, null: false  #우편번호
      t.string :address_detail, null: true #상세주소
      t.string :address_extra_info, null: false #주소 추가정보(빌라이름, 아파트이름같은것)
  

      ## Recoverable
      t.string   :reset_password_token
      t.datetime :reset_password_sent_at

      ## Rememberable
      t.datetime :remember_created_at

      ## Trackable
      t.integer  :sign_in_count, default: 0, null: false
      t.datetime :current_sign_in_at
      t.datetime :last_sign_in_at
      t.string   :current_sign_in_ip
      t.string   :last_sign_in_ip

      ## Confirmable
      # t.string   :confirmation_token
      # t.datetime :confirmed_at
      # t.datetime :confirmation_sent_at
      # t.string   :unconfirmed_email # Only if using reconfirmable

      ## Lockable
      # t.integer  :failed_attempts, default: 0, null: false # Only if lock strategy is :failed_attempts
      # t.string   :unlock_token # Only if unlock strategy is :email or :both
      # t.datetime :locked_at


      t.timestamps null: false
    end

    add_index :users, :email,                unique: true
    add_index :users, :reset_password_token, unique: true
    # add_index :users, :confirmation_token,   unique: true
    # add_index :users, :unlock_token,         unique: true
  end
end
