class WeniqueController < ApplicationController
  def index
    
    
    #수공업자 권한부여
    users = User.all
    users.each do |u|
      if u.authorization != '0' && u.business_number != nil
        u.authorization = '1'
        u.save
      end
    end
  end

  def product
  end

  def contact
  end

  def checkout
  end

  def categories
  end

  def cart
  end
  
  def assign_order_new
    @categories = Category.all
    @order = AssignRequest.new
  end
  
  def assign_order_create
    @order = AssignRequest.new(order_params)
    @order.content = params[:assign_request][:content]
    @order.c_id = current_user.id
    @order.g_private = params[:assign_request][:g_private]
    categories = params[:assign_request][:category_ids].split(',')
    categories.each do |c|
      @order.category_ids << c
    end
    
    uploader = ImguploaderUploader.new
    uploader.store!(params[:img])
    @order.img_url = uploader.url
    @order.save
    
    redirect_to '/'
    
  end
  
  def unassign_order
  end
  
  def handicrafts
  end
  
private
    def order_params
      params.require(:assign_request).permit(:content, :g_private_value, category_ids: [])
    end
  
end
