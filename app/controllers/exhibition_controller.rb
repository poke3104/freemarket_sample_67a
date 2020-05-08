class ExhibitionController < ApplicationController
  def index

  end

  def new
    @commondity = Commondity.new
    @commondity.images.new
    @commondity.build_brands
    @commondity.build_shipping_charges
    @commondity.build_clothes
  end

  def create
    @commondity = Commondity.new(commondity_params)
    if @commondity.save
      redirect_to root_path
    else
      redirect_to root_path
    end
    
  end

  def commondity_params
    params.require(:commondity ).permit(:name, :text, :condition, :category_id, :brand_id, :shipping_method, :day_to_ship, :prefecture_id, :price, :seller_id, :buyer_id, :sale_status,images_attributes: [:image]).merge(seller_id: current_user.id)
  end
end
