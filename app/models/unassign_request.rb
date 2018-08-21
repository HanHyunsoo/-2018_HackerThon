class UnassignRequest < ActiveRecord::Base
    has_and_belongs_to_many :categorys
    has_many :unassign_request_comments, dependent: :destroy
    has_one :good
    belongs_to :user
end
