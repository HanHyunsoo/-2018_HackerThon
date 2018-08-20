class AssignRequest < ActiveRecord::Base
    has_and_belongs_to_many :categories
    # , :join_table => "assign_requests_categories", :foreign_key => "assign_request_id"
end
