class ItemsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create, :edit]
  before_action :set_furima, only: [:show, :edit, :create, :update]
  
  def index
    @items = Item.all.order("created_at DESC")
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

  def show
  end

  def edit
    unless @item.user_id == current_user.id
      redirect_to root_path
    end
  end

  def update
    @item.update(item_params)
    if @item.save
      redirect_to items_path
    else
      render :edit
    end

    unless @item.user_id == current_user.id
      redirect_to root_path
    end
  end

  private
  def item_params
    params.require(:item).permit(
      :image, :name, :description, :price, :category_id, :status_id, :delivery_charge_id, :region_id, :delivery_days_id
    ).merge(user_id: current_user.id)
  end

  def set_furima
    @item = Item.find(params[:id])
  end
end
