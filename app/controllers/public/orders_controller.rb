class Public::OrdersController < ApplicationController
  def new
       @order= Order.new
       @order.name
       @order.address
       
       
  end
  
  
  def index
    @orders = current_customer.orders.all
    
  end
  
  def show
    @order=Order.find(params[:id])
    @order_details = @order.order_details
  end
  
  def thanx
  end
  
  def confirm
      @order = Order.new(order_params)
      @order.postal_code = current_customer.postal_code
      @order.address = current_customer.address
      @order.name = current_customer.full_name
      @cart_items = current_customer.cart_items
      @order_new = Order.new
        render :confirm
  end

  def create
    @order = Order.new(order_params)
    @order.address = current_customer.address
    @order.customer_id = current_customer.id
    @order.save
    current_customer.cart_items.each do |cart_item| #カートの商品を1つずつ取り出しループ
      @order_detail = OrderDetail.new #初期化宣言
      @order_detail.item_id = cart_item.item_id #商品idを注文商品idに代入
      @order_detail.quantity = cart_item.amount #商品の個数を注文商品の個数に代入
      @order_detail.price = (cart_item.item.price*1.1).floor #消費税込みに計算して代入
      @order_detail.order_id =  @order.id #注文商品に注文idを紐付け
      @order_detail.save #注文商品を保存
     
    end #ループ終わり@order.save
  
    current_customer.cart_items.destroy_all
    redirect_to orders_thanks_path
  end
  
  private
  
  def order_params
    params.require(:order).permit(:name, :address, :total_price, :postal_code, :payment_method, :shipping_fee)
  end
  
  def address_params
    params.require(:order).permit(:name, :address)
  end
end

