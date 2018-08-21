class Category < ActiveRecord::Base
    has_and_belongs_to_many :assign_requests
    has_and_belongs_to_many :users
    has_and_belongs_to_many :unassign_requets
end
