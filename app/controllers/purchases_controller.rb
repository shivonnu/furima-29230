class PurchasesController < ApplicationController
  before_action :set_item, only: [:show]

  def show
  end
 
  private

  def set_item
    @item = Item.find_by(id: params[:id])
  end

end
