class TagsController < ApplicationController
  before_action :set_tag, only: [:edit_tags, :update]



  def update
    if @tag.update(tag_params)
      redirect_to item_path(@item.id)
    else
      flash.now
      render :edit
    end
  end

  private

  def set_tag
    @tag = ItemTag.includes(:tag).where(item_id: params[:id])
  end

  def tag_params
    params.require(:tag).permit(:tag_name).merge(item_id: params[:id])
  end

end
