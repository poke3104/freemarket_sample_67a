class CommoditiesController < ApplicationController
  before_action :set_product,  only: [:edit, :update, :destroy]

  
  def new
    @commodity = Commodity.new
    @commodity.images.new
    @category_select = ["選択して下さい"]
    Category.where(ancestry: nil).each do |parent|
      @category_select << parent.name
    end 
    @commodity.build_brand
    # @commodity.build_shipping_charge
  end

  def category_children 
    @category_children = Category.find_by(name: "#{params[:parent_name]}", ancestry: nil).children
  end

  def category_grandchildren
    @category_grandchildren = Category.find_by(name: "#{params[:child_name]}").children
  end

  def create
    # binding.pry
    @commodity = Commodity.new(commodity_params)
    if @commodity.save!
      redirect_to root_path
    else
      redirect_to new_commodity_path
    end
  end

  def update
    if @commodity.update(commodity_params)
      redirect_to root_path
    else
      render :edit
    end
  end


  private

  def commodity_params
    params.require(:commodity).permit(:name, :text, :category_id, :clothe, :condition, :shipping_charge, :shipping_method, :prefecture_id, :day_to_ship, :price, :exhibition_commodity_id, brands_attributes: [:id, :name])
    # , categories_attributes: [:id, :name]
    #  :brand_id,, :purchase_commodities, :sales_status, :postage
    # .merge(user_id: current_user.id) ユーザー機能実装後追加
    # images_attributes: [:image, :_destroy, :id],
  end

  def set_item
    @commodity = Commodity.find(params[:id])
  end
  
end