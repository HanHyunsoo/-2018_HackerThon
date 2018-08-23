class Good < ActiveRecord::Base
    belongs_to :assign_request
    belongs_to :unassign_request
    has_one :request_status
    has_one :portfolio
    has_many :reviews, dependent: :destroy
    has_many :order_items
    
    has_many :carts
    has_many :Users, through: :Carts
    
    has_many :itemorder
    has_many :orders, through: :goodorder    
end
