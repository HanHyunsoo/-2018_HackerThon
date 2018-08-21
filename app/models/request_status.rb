class RequestStatus < ActiveRecord::Base
    belongs_to :status
    belongs_to :good
end

