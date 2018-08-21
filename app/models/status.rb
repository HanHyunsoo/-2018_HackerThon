class Status < ActiveRecord::Base
    has_many :request_statues, dependent: :destroy
end
