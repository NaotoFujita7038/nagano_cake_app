class Public::ItemsController < ApplicationController
before_action :authenticate_customer!, only: [:show]

def index
    @items=Item.all
    Item.count
    
    
end

def show 
    @item=Item.find(params[:id])
    @cart_item=CartItem.new
   
    
    
end

private
  
  def item_params
    params.require(:item).permit(:name, :image, :introduction, :price,:image)
  end  
end

def authenticate_customer
    unless customer_signed_in?
      redirect_to new_customer_session_path
    end
end