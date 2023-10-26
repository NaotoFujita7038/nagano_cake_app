class Public::CustomersController < ApplicationController
  before_action :authenticate_customer!
  def show
  @customer = current_customer
  
  end

  def update
    @customer = current_customer
    if @customer.update(customer_params)
      redirect_to public_customer_path(@customer), notice: "登録情報が更新されました。"
    
    end
  end
  
  def check
    @customer = current_customer
  end

  def withdraw
    @customer = Customer.find(current_customer.id)
    @customer.update(is_active: false)
      reset_session
      flash[:notice] = "Thank you for the good rating. We hope to see you again."
    redirect_to new_customer_registration_path
  end
  

end
