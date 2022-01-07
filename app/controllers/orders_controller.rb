class OrdersController < ApplicationController
  before_action :authenticate_user!, only: :index
  before_action :order_set, only: [:index, :create]

  def index
    @order_address = OrderAddress.new
    redirect_to root_path unless (current_user.id == @item.user.id && @item.order.nil?) || (current_user.id != @item.user.id && @item.order.nil?)
  end

  def create
    @order_address = OrderAddress.new(order_address_params)
    if @order_address.valid?
      Payjp.api_key = ENV['PAYJP_SECRET_KEY']
      Payjp::Charge.create(
        amount: @item.price,
        card: order_address_params[:token],
        currency: 'jpy'
      )
      @order_address.save
      redirect_to root_path
    else
      render :index
    end
  end

  private

  def order_address_params
    params.require(:order_address).permit(:postal_code, :prefecture_id, :city, :address, :building, :phone_number).merge(
      user_id: current_user.id, item_id: params[:item_id], token: params[:token]
    )
  end

  def order_set
    @item = Item.find(params[:item_id])
  end
end
