class ConfirmationPagesController < ApplicationController
  
  before_action :set_card

  def index
    @commodities = Commodity.find(params[:id])
    if @set_card.blank?
      redirect_to controller: "credit", action: "new"
    else
      Payjp.api_key =Rails.application.credentials.payjp[:payjp_access_key]
      customer = Payjp::Customer.retrieve(@set_card.customer_id)
      @default_card_information = customer.cards.retrieve(@set_card.card_id)
    end
  end

  def pay
    @commodities = Commodity.find(params[:id])
    Payjp.api_key =Rails.application.credentials.payjp[:payjp_access_key]
    Payjp::Charge.create(
    :amount => @commodities.price, 
    :customer => @set_card.customer_id, 
    :currency => 'jpy', 
  )
  @commodities_buyer = Commodity.find(params[:id])
  @commodities_buyer.update(sales_status_id: 2)
  redirect_to done_confirmation_pages_path(id: @commodities) 
  end

  def done
    @commodities = Commodity.find(params[:id])
  end

  private

  def set_card
    @set_card = Card.where(user_id: current_user.id).first
  end
end
