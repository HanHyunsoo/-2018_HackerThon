class Front::Members::RegistersController < Devise::RegistrationsController
  def new
      @user = User.new()
  end
    
  def create
    super
  end
  

end
