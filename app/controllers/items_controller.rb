class ItemsController < ApplicationController
  def index
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
  end

  private
  def item_params
    params.require(:item).permit(:category_id, :status_id, :delivery_charge_id, :region_id, :delivery_days_id)
  end
end
