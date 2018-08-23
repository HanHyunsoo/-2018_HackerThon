class Order < ActiveRecord::Base
    belongs_to :user
    
    has_many :goodorders, dependent: :destroy
    has_many :items, through: :goodorders
end
