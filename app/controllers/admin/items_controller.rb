class Admin::ItemsController < ApplicationController
  before_action :authenticate_admin!
  
  
  def index
    @item=Item.new
    @item.id
    @item.name
    @item.price
    @items=Item.all
  end

  def show
    @item=Item.find(params[:id])
    @item.id
    @item.name
    @item.price
    @cart_item_new = CartItem.new
  end

  def new
    @item = Item.new
    
  end

  def edit
    @item=Item.find(params[:id])
    @item.id
    @item.introduction
    @item.name
    @item.price
    
  end
  
  def create
    @item=Item.new(item_params)
    @item.id
    @item.name
    @item.price
    @item.save
    redirect_to admin_items_path 
  end

  def update
    @item = Item.find(params[:id])
 if  @item.update(item_params)
    redirect_to admin_item_path(@item.id)  
 else
       render 'edit'
 end
  end
  
 
  private
  
  def item_params
    params.require(:item).permit(:name, :image, :introduction, :price)
  end  
end
