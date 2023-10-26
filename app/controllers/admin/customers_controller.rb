class Admin::CustomersController < ApplicationController
def index
    @customers= Customer.all
    
  
end

def show
   @customer = Customer.find(params[:id])
  
  
     
end

def edit
    @customer = Customer.find(params[:id])
end 
def update
    @customer = current_customer
  if @customer.update(customer_params)
      redirect_to admin_customer_path(@customer), notice: "登録情報が更新されました。"
  else
      render :edit
  end
end



private

def customer_params
    params.require(:customer).permit(:last_name, :first_name, :last_name_kana, :first_name_kana, :postcode, :address, :email, :telephone_number )
end
end

