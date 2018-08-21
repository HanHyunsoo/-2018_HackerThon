class Good < ActiveRecord::Base
    belongs_to :assign_request
    belongs_to :unassign_request
    has_one :request_status
    has_one :portfolio
    has_many :reviews, dependent: :destroy
end
