class OrdersController < ApplicationController
  before_action :authenticate_user!, except: :index

  def index
    @item = Item.find(params[:item_id])
    @order_form = OrderForm.new
  end

  def create
    @order_form = OrderForm.new(order_params)
    if @order_form.valid?
      pay_item
      @order_form.save
      redirect_to root_path
    else
      render :index
    end
  end

  private

  def order_params
    params.require(:order_form).permit(:postcode, :prefecture_id, :city, :building_name, :phone_number).merge(user_id: current_user.id, item_id: params[:item_id], token:params[:token])
  end
end