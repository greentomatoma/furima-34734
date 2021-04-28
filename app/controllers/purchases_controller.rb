class PurchasesController < ApplicationController
  before_action :authenticate_user!, only: [:index, :create]
  before_action :set_furima, only: [:index, :create]

  def index
    @purchase_address = PurchaseAddress.new
    @purchase = Purchase.new
    if current_user.id == @item.user_id || @item.purchase != nil
      redirect_to root_path
    end
  end

  def create
    @purchase_address = PurchaseAddress.new(purchase_address_params)
    if @purchase_address.valid?
      purchase_item
      @purchase_address.save
      redirect_to root_path
    else
      render :index
    end
  end

  private

  def purchase_address_params
    params.require(:purchase_address).permit(:postcode, :region_id, :city, :block, :building, :phone_number).merge(
      user_id: current_user.id, item_id: params[:item_id], token: params[:token]
    )
  end

  def set_furima
    @item = Item.find(params[:item_id])
  end

  def purchase_item
    @item = Item.find(params[:item_id])
    Payjp.api_key = ENV['FURIMA_PAYJP_SECRET_KEY']
    Payjp::Charge.create(
      amount: @item.price,
      card: purchase_address_params[:token],
      currency: 'jpy'
    )
  end
end
