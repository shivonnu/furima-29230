class PurchasesController < ApplicationController
  before_action :set_item, only: [:index, :create]
 def index
 end

  def create
    binding.pry
  end
 
  private

  def set_item
    @item = Item.find_by(id: params[:item_id])
  end

end
