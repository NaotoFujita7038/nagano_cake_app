class Public::CartItemsController < ApplicationController
  def index
    @cart_items = current_customer.cart_items
    @cart_item=current_customer
    @total =0
     
  end
  
  def create
    cart_item = CartItem.new(cart_item_params)
    cart_item.customer = current_customer
    cart_item.item_id = cart_item_params[:item_id]
    if CartItem.find_by(item_id: params[:cart_item][:item_id]).present?
      cart_item = CartItem.find_by(item_id: params[:cart_item][:item_id])
      cart_item.amount += params[:cart_item][:amount].to_i
      cart_item.update(amount: cart_item.amount)
      redirect_to cart_items_path
    else
      cart_item.save
      redirect_to cart_items_path
    end
  end
  
  def update
    cart_item = CartItem.find(params[:id])
    cart_item.update(cart_item_params)
    redirect_back(fallback_location: root_path)
  end
  
  def destroy
    @cart_item= CartItem.find(params[:id])  # データ（レコード）を1件取得
    @cart_item.destroy  # データ（レコード）を削除
    redirect_to '/cart_items'  # 投稿一覧画面へリダイレクト
  end
  
  def destroy_all
    current_customer.cart_items.destroy_all
    redirect_to '/cart_items'
  end
  
private
  
def cart_item_params
  params.require(:cart_item).permit(:item_id, :amount)
end
end