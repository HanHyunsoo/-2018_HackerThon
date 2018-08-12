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
    end
end
