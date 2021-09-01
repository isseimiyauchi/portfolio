class CustomersController < ApplicationController
  def index
    @customers = Customer.all
    gon.customer = @customers
    @posts = Customer.all.count
  end

  def new
    @customer = Customer.new
  end

  def create
    @customer = Customer.new(customer_params)
      if @customer.save
        flash[:success] = "お客様情報を新規登録しました。"
        redirect_to :customers
      else
        flash[:danger] = "お客様情報を登録できませんでした。"
        render "new"
      end
  end

  def show
    @customer = Customer.find(params[:id])
    gon.customer = @customer
  end

  def edit
    @customer = Customer.find(params[:id])
    gon.customer = @customer
  end

  def update
    @customer = Customer.find(params[:id])
      if @customer.update(customer_params)
        flash[:success] = "お客様情報を更新しました。"
        redirect_to :customers
      else
        flash[:danger] = "お客様情報を更新できませんでした。"
        render "edit"
      end
  end

  def destroy
    @customer = Customer.find(params[:id])
    @customer.destroy
    flash[:danger] = "お客様情報を削除しました。"
    redirect_to :customers
  end

  private

  # ストロングパラメーター
  def customer_params
    params.require(:customer).permit(:name, :address, :number, :assets, :right, :memo)
  end
end
