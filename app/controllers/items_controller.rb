class ItemsController < ApplicationController
  
  def index
    @items = Item.all
  end

  def new
    @item = Item.new
  end

  def create
    Item.create(item_params)
    if @item.save
      redirect_to root_path
    else
      render :new
    end
  end
  
  private
  
  def item_params
    params.require(:item).permit(:name, :description, :category_id, :items_status_id, :shipping_cost_id, :prefecture_id, :shipping_date_id, :price)
  end

end