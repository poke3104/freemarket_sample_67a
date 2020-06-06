class DetailPagesController < ApplicationController
  def index
    @commodity_detail = Commodity.find(params[:id])
  end

  def destroy
    commodity = Commodity.find(params[:id])
    if commodity.destroy
      redirect_to root_path
    else
      render :index
    end
  end
end
