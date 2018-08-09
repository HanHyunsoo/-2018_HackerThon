class Front::Members::RegistersController < ApplicationController
  def new
      @user = User.new()
  end
    
  def create
    super
  end
end
