class Admin::OrdersController < ApplicationController
  def show
 @order = Order.find(params[:id])
 @order_details = @order.order_details
 
 

  end
  
#   private
  
#   def order_params
#     params.require(:order).permit(:status)
#   end
#   def order_params
#       params.require(:order).permit(:name, :address, :total_price, :postal_code, :payment_method, :shipping_fee)
#   end
end
