class Public::CustomersController < ApplicationController
  def show
  @customer = current_customer
  end

  def update
    @customer = current_customer
    if @customer.update(customer_params)
      redirect_to public_customer_path(@customer), notice: "登録情報が更新されました。"
    
    end
  end
end
