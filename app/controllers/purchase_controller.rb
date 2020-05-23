class PurchaseController < ApplicationController

  before_action :set_card

  def index
    if @set_card.blank?
      redirect_to controller: "credit", action: "new"
    else
      Payjp.api_key =ENV["PAYJP_ACCESS_KEY"]
      customer = Payjp::Customer.retrieve(@set_card.customer_id)
      @default_card_information = customer.cards.retrieve(@set_card.card_id)
    end
  end

  def pay
    @commodities = Commodity.find(commodity_id: 1,sales_status_id: 1,price_id:1)
    Payjp.api_key =ENV["PAYJP_ACCESS_KEY"]
    Payjp::Charge.create(
    :amount => 100 
    :customer => @set_card.customer_id, 
    :currency => 'jpy',
  )
  @commodities_buyer = Commodity.find(sales_status_id: 1)
  @commodities_buyer.update(sales_status_id: 1)
  redirect_to action: 'done'
  end

  private

  def set_card
    @set_card = Card.where(user_id: 1).first
  end
end
