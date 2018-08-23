class Cart < ActiveRecord::Base
    
    belongs_to :user
    belongs_to :good
    
    def goodz
        @good = Good.find(self.good_id)
        return @good
    end
    
 
end
