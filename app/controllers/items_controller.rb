class ItemsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create, :edit, :update, :destroy]
  before_action :set_furima, only: [:show, :edit, :update, :destroy]
  before_action :prevent_url, only: [:edit, :update, :destroy]

  def index
    @items = Item.all.order('created_at DESC')
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
  end

  def update
    if @item.update(item_params)
      redirect_to items_path
    else
      render :edit
    end
  end

  def destroy
    redirect_to root_path if @item.destroy
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

  def prevent_url
    redirect_to root_path unless @item.user_id == current_user.id
  end
end
