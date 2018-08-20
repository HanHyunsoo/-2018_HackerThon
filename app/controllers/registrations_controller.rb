class RegistrationsController < Devise::RegistrationsController
    def user_new
        @user = User.new()
    end
    
    def create
        super
    end
    
     def update
        super
     end
    
    def seller_new
        @user = User.new()
        users = User.all
        users.each do |u|
            if u.authorization != '0' && u.business_number != nil
                u.authorization = '1'
                u.save
            end
        end
    end
end