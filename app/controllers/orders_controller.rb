class OrdersController < ApplicationController
  before_action :set_order, only: [:show, :destroy]


  # GET /orders
  # GET /orders.json
  def index
    @orders = Order.where user_id: current_user.id

  end

  # GET /orders/1
  # GET /orders/1.json
  def show
    @orders = @order.goodorders
  end
  
  def all
    @orders = Order.all
  end

  def placeorder
    @user = User.find(current_user.id)
    @total = 0
    @total_goods = 0
    @continue = 0
    flash[:notice] = []
    
      
    # #Tests if the cart has enough stock, if not it removes from cart 
    # @user.carts.each  do |cart|
    #   if (cart.quantity > cart.good.quantity)
    #     flash[:notice] << "Not enough stock in store for #{cart.goodz.name}"
    #     cart.destroy
    #     @total_goods += 1
    #   else
    #     @continue += 1
    #     @total_goods += 1
    #   end
    # end
    
    #Test weather first test was sucessful, if it was it continues, if not it redirects back to cart with notice
    if @continue == @total_goods
      @user.carts.each  do |cart|
        @total += (cart.good.price * cart.quantity) 
        
      end
    else
      redirect_to root_url + "cart" and return
    end
    
    @order = Order.create
    @order.user_id = @user.id
    @user.carts.each do |cart|
      @goodO = Goodorder.new
      
      @goodO.quantity = cart.quantity
      @goodO.good_id = cart.good_id
      @goodO.order_id = @order.id
      @goodO.save
      
    end
    
    @order.total = @total


    
    respond_to do |format|
      if @order.save
        @user.good_ids = ""
        @user.save
        
        format.html { redirect_to @order, notice: 'Order was successfully created.' }
        format.json { render :show, status: :created, location: @order }
      else
        format.html { render :new }
        format.json { render json: @order.errors, status: :unprocessable_entity }
      end
    end

    
    

    
    
  end

  # DELETE /orders/1
  # DELETE /orders/1.json
  def destroy
    @order.destroy
    respond_to do |format|
      format.html { redirect_to orders_url, notice: 'Order was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_order
      @order = Order.find(params[:id])
      print @order.user_id.to_s + "order id"
      print current_user.id.to_s + "my id"

      #cant seem to get the or to work properly
      # if !current_user.try(:isadmin) || @order.user_id != current_user.id
      #   flash[:notice] = 'That was not your order.'
      #   redirect_to orders_url
      # end

    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def order_params
      params.require(:order).permit(:total, :user_id)
    end
    

end




# class OrdersController < ApplicationController
#   before_action :set_order, only: [:show, :edit, :update, :destroy]
#   before_action :authenticate_user!, only: [:index,:show, :destroy, :placeorder]  

#   # GET /orders
#   # GET /orders.json
#   def index
#     @orders = Order.where user_id: current_user.id
#   end

#   # GET /orders/1
#   # GET /orders/1.json
#   def show
#     @orders = @order.goodorders
#   end


#   def all
#     @order = Order.all
#   end
  
#   def placeorder
#     @user = User.find(current_user.id)
#     @total = 0
#     @total_goods = 0
#     @continue = 0
#     flash[:notice] = []
    
      

    
#     #Test weather first test was sucessful, if it was it continues, if not it redirects back to cart with notice
#     if @continue == @total_goods
#       @user.carts.each  do |cart|
#         @total += (cart.good.price * cart.quantity) 
#         cart.updateqty(cart.quantity)
#       end
#     else
#       redirect_to root_url + "cart" and return
#     end
    
#     @order = Order.create
#     @order.user_id = @user.id
#     @user.carts.each do |cart|
#       @goodO = Goodorder.new
      
#       @goodO.quantity = cart.quantity
#       @goodO.good_id = cart.good_id
#       @goodO.order_id = @order.id
#       @goodO.save
      
#     end
#     @order.total = @total
    

#   # POST /orders
#   # POST /orders.json
#   def create
#     @order = Order.new(order_params)

#     respond_to do |format|
#       if @order.save
#         @user.good_ids = ""
#         @user.save
        
#         format.html { redirect_to @order, notice: 'Order was successfully created.' }
#         format.json { render :show, status: :created, location: @order }
#       else
#         format.html { render :new }
#         format.json { render json: @order.errors, status: :unprocessable_entity }
#       end
#     end
#   end


#   # DELETE /orders/1
#   # DELETE /orders/1.json
#   def destroy
#     @order.destroy
#     respond_to do |format|
#       format.html { redirect_to orders_url, notice: 'Order was successfully destroyed.' }
#       format.json { head :no_content }
#     end
#   end


#   # private
#   #   # Use callbacks to share common setup or constraints between actions.
#   #   def set_order
#   #     @order = Order.find(params[:id])
#   #     print @order.user_id.to_s + "order id"
#   #     print current_user.id.to_s + "my id"      
#   #   end
  



#   #   # Never trust parameters from the scary internet, only allow the white list through.
#   #   def order_params
#   #     params.require(:order).permit(:total, :user_id)
#   #   end
    
    
#   # end
  
#   private
#     # Use callbacks to share common setup or constraints between actions.
#     def set_order
#       @order = Order.find(params[:id])
#       print @order.user_id.to_s + "order id"
#       print current_user.id.to_s + "my id"

#       #cant seem to get the or to work properly
#       # if !current_user.try(:isadmin) || @order.user_id != current_user.id
#       #   flash[:notice] = 'That was not your order.'
#       #   redirect_to orders_url
#       # end

#     end

#     # Never trust parameters from the scary internet, only allow the white list through.
#     def order_params
#       params.require(:order).permit(:total, :user_id)
#     end
    
#     def signed_in
#       if !logged_in?
#         redirect_to root_url + "login"
#       end
#     end
    
#     def check_admin
#       if !current_user.try(:isadmin?)
#         redirect_to orders_url
#       end
#     end
# end  