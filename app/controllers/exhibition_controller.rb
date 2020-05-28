class ExhibitionController < ApplicationController
  def index

  end

  def new
    @commodity = Commodity.new
    @commodity.images.new
    @commodity.build_brands
    @commodity.build_shipping_charges
  end

  def create
    @commodity = Commodity.new(commodity_params)
    if @commodity.save
      redirect_to root_path
    else
      redirect_to new_commodity_path
    end
    
  def new
    @commodity = Commodity.new
    @category_select = ["選択して下さい"]
    Category.where(ancestry: nil).each do |parent|
      @category_select << parent.name
    end 
  end

  def category_children 
    @category_children = Category.find_by(name: "#{params[:parent_name]}", ancestry: nil).children
  end

  def category_grandchildren
    @category_grandchildren = Category.find_by(name: "#{params[:child_name]}").children
  end

  def commodity_params
    params.require(:commodity ).permit(:name, :text, :size, :condition, :categories_ids, :shipping_method, :day_to_ship, :prefecture_id, :price, images_attributes: [:image], shippingcharges_attributes: [:id], brands_attributes: [:id]).merge(seller_id: current_user.id)
  end
end