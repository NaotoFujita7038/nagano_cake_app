class Public::CustomersController < ApplicationController
  before_action :authenticate_customer!
  def show
  @customer = current_customer
  
  end
  
  def edit
   @customer=current_customer
 
    
  end

  def update
    @customer = current_customer
    if @customer.update(customer_params)
      redirect_to customers_mypage_path, notice: "登録情報が更新されました。"
    
    end
  end
  
  def check
    @customer = current_customer
    
  end

  def withdrawal 
    @customer = Customer.find(current_customer.id)
    @customer.update(is_active: false)
      reset_session
      flash[:notice] = "Thank you for the good rating. We hope to see you again."
    redirect_to new_customer_registration_path
  end
  
   private 

    def customer_params
      params.require(:customer).permit(:last_name,:first_name,:last_name_kana,:first_name_kana,:postal_code,:address,:telephone_number,
:email)
    end

end
