class PurchasesController < ApplicationController
  before_action :authenticate_user!, only: [:index, :create]
  before_action :set_furima, only: [:index, :create]
  # before_action :prevent_url, only: [:index, :create]

  def index
    @purchase_address = PurchaseAddress.new
  end

  def create
    @purchase_address = PurchaseAddress.new(purchase_address_params)
    if @purchase_address.valid?
      @purchase_address.save
      redirect_to root_path
    else
      render :index
    end
  end

  private

  def purchase_address_params
    params.require(:purchase_address).permit(:postcode, :region_id, :city, :block, :building, :phone_number).merge(user_id: current_user.id, item_id: params[:item_id])
  end

  def set_furima
    @item = Item.find(params[:item_id])
  end

  # def prevent_url
  #   @item = Item.find(params[:item_id])
  #   redirect_to root_path if current_user == @item.user_id
  # end
end
