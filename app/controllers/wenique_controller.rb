class WeniqueController < ApplicationController
  before_action :require_login, only: [:assign_order_new, :assign_order_show]
  
  def index
    #수공업자 권한부여
    users = User.all
    users.each do |u|
      if u.authorization != '1' && u.business_number != nil
        u.authorization = '2'
        u.save
      end
    end
  end


  def product
    @goods = Good.all
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
    @sellers = User.where(authorization: 2).order(:name)
    
  end
  
  def assign_order_create
    @order = AssignRequest.new(order_params)
    @order.content = params[:assign_request][:content]
    @order.c_id = current_user.id
    @order.s_id = params[:assign_request][:s_id]
    @order.g_private = params[:assign_request][:g_private]
    

      categories = params[:assign_request][:category_ids].split(',')
      categories.each do |c|
        @order.category_ids << c
      end
    @order.save
    PriceComfirm.new(request_id: @order.id).save
    
    redirect_to "/wenique/assign_order/show/#{@order.id}"
  end
  
  def assign_order_show
    @order = AssignRequest.find(params[:id])
    @comment = AssignRequestComment.new
    @order_comments = AssignRequestComment.where(request_id: @order.id)
    @current_user_autority = current_user.id
    @price_check_status = PriceComfirm.where(request_id: @order.id).first

  end
  
  def assign_order_edit
    @order = AssignRequest.find(params[:id])
    @categories = Category.all

  end
  
  def assign_order_update
    @order = AssignRequest.find(params[:id])
    @order.content = params[:assign_request][:content]
    @order.c_id = current_user.id
    @order.g_private = params[:assign_request][:g_private]
    @order.categories.clear
    cate = params[:assign_request][:category_ids].split(',')
    cate.each do |c|
      @order.category_ids = c
    end
    
    unless params[:assign_request][:img_url] == nil
      @order.img_url = params[:assign_request][:img_url]
    end

    @order.save
    
    redirect_to "/wenique/assign_order/show/#{@order.id}"
  end
  
  def assign_order_comment_create
    @order = AssignRequest.find(params[:id])
    @comment = AssignRequestComment.new
    @comment.content = params[:assign_request_comment][:content]
    @comment.u_id = current_user.id
    @comment.request_id = @order.id
    @comment.save
    
    redirect_to "/wenique/assign_order/show/#{@order.id}"
  end
  
  def assign_order_make_price
    @price = PriceComfirm.where(request_id: params[:id]).first

  end
  
  def assign_order_make_price_create
    @order = AssignRequest.find(params[:id])
    @price = PriceComfirm.where(request_id: @order.id).first
    @price.price = params[:price_comfirm][:price]
    @order.s_id = current_user.id
    @order.save
    @price.save
    
    redirect_to "/wenique/assign_order/show/#{@order.id}"
  end
  
  def user_search
    # @seller = Users.where(authorization = '2')
    @users = Users.search do
      keywords params[:query]
    end.results
  
    respond_to do |format|
      format.html { render :action => "assign_order_new" }
      format.xml  { render :xml => @users }
  end
  
  redirect_to :back
  end
  
  def unassign_order
  end
  
  def handicrafts
    @user = User.all
  end
  
private
    def order_params
      params.require(:assign_request).permit(:content, :s_id, :g_private_value, :img_url, category_ids: [])
    end
    
    def require_login
      unless user_signed_in?
      redirect_to '/users/sign_in'
      end
    end
  
  
end
