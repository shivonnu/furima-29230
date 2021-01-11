class TagsController < ApplicationController
  def search
    @item = Item.find_by(id: params[:id])
    @tag = ItemTag.includes(:tag).where(item_id: @item.id)
    return nil if params[:keyword] == ""
    tag = Tag.where(['tag_name LIKE ?', "%#{params[:keyword]}%"] )
    render json:{ keyword: tag }
  end

end
