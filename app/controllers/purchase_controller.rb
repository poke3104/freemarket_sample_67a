class PurchaseController < ApplicationController
  def index
    card = Card.where(user_id: 1).first
    if card.blank?
      redirect_to controller: "credit", action: "new"
    else
      Payjp.api_key = "sk_test_68a20abc86387e6c7cfc8b9c"
      customer = Payjp::Customer.retrieve(card.customer_id)
      @default_card_information = customer.cards.retrieve(card.card_id)
    end
  end

  def pay
    card = Card.where(user_id: 1).first
    @commodities = Commodity.find(commodity_id: 1,sales_status_id: 1,price_id:1)
    Payjp.api_key = "sk_test_68a20abc86387e6c7cfc8b9c"
    Payjp::Charge.create(
    :amount => 100 
    :customer => card.customer_id, 
    :currency => 'jpy',
  )
  @commodities_buyer = Commodity.find(sales_status_id: 1)
  @commodities_buyer.update(sales_status_id: 1)
  redirect_to action: 'done'
  end
end
