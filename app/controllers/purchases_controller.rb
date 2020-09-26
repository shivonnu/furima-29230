class PurchasesController < ApplicationController
  def index
    @item = Item.find_by(id: params[:id])
  end
 
end
