class ItemsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create]
  
  def index
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path
    else
      render :new
    end
  end

  private
  def item_params
    params.require(:item).permit(
      :image, :name, :description, :price, :category_id, :status_id, :delivery_charge_id, :region_id, :delivery_days_id
    ).merge(user_id: current_user.id)
  end
end
