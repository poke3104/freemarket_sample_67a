class CommoditiesController < ApplicationController
  def index
    @commodities = Commodity.all.order(sales_status_id: "DESC", id: "ASC")
    @last_commodities = @commodities.last(3)
  end

  def show
    @commodity = Commodity.find(params[:id])
    # コメントを表示するためデータ取得
    @comments = @commodity.comments.includes(:user).all
    @comment = Comment.new
  end

  def destroy
    @commodity = Commodity.find(params[:id])
    if commodity.destroy
      redirect_to root_path
    else
      render :index
    end
  end

end
