class MypageController < ApplicationController
  def mypage
  end
  
  def requests_list
    if current_user.authorization == '2'
      @id = current_user.id
      @requests = AssignRequest.where(s_id: @id).all
    else
      @id = current_user.id
      @requests = AssignRequest.where(c_id: @id).all
    end
      
    
  
  end

      
end
