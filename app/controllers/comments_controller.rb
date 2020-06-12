class CommentsController < ApplicationController
  before_action :authenticate_user!

  def create
    # paramsで送られてきたidから該当commodityを探す
    commodity = Commodity.find(params[:commodity_id])
    @comment = Comment.new(comment_params)
    @comment.save
  end

  def destroy
    commodity = Commodity.find(params[:commodity_id])
    @comment = commodity.comments.find(params[:id])
    @comment.destroy
    redirect_back(fallback_location: commodity_path(commodity))
  end

  private

    def comment_params
      params.require(:comment).permit(:text).merge(user_id: current_user.id, commodity_id: params[:commodity_id])
    end
end
